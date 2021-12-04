//
//  StockTableViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/14/21.
//

import UIKit
import CoreData
class StockTableViewController: UITableViewController,UISearchBarDelegate {
 
    var context: NSManagedObjectContext=(UIApplication.shared.delegate as! AppDelegate).managedObjectContext!

    public static var items=AppDelegate.GlobalVariable.StockCoreitems
    public static var choosedStock: StockCore?
    let request = StockCore.fetchRequest() as NSFetchRequest<StockCore>
    
    
   var filtereditems:[StockCore]?
    var searchController = UISearchController(searchResultsController:nil)
    
    var listOfStock=[resultsDetail](){
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
               
               // self.addtoCoreData()
                //self.navigationItem.title="\(self.listOfStock.count) stock Count"
            }
        }
    }
    
  /*  func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {return }
        filterContentForSearchText(text)
    }
    func filterContentForSearchText (_ searchText:String){
        let pred=NSPredicate(format: "name contains[cd] %@",searchText.lowercased())
        request.predicate=pred
        do {
          
            self.filtereditems = try context.fetch(request)

            tableView.reloadData()
        }catch {
            
        }
    
    }
   */
    func addtoCoreData(){
        for index in 0..<listOfStock.count{
            let newStockCore = StockCore(context: self.context)
            print(self.listOfStock[index].T)
            newStockCore.name=listOfStock[index].T
            newStockCore.financialRating=Int64(9)
            newStockCore.lastTradePrice=Double(listOfStock[index].c)
            newStockCore.ofCompany=AddStockViewController.choosedCompanyForStock
            newStockCore.ofCategory=AddStockViewController.choosedCategoryForStock
            //save data
            do {
                try! self.context.save()
                
            }catch{
                
            }
        }
        
    }
    
    
  /*
    func isFiltering()->Bool{
        return searchController.isActive && !(searchController.searchBar.text?.isEmpty)!
    }
    public func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        let text=searchBar.text
        filterContentForSearchText(text!)
    }
    
    */

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        fetchStock()
        self.navigationItem.leftBarButtonItem=self.editButtonItem
        
        navigationItem.searchController=searchController
        searchController.searchBar.delegate=self
       
        searchController.obscuresBackgroundDuringPresentation=false
        searchController.searchBar.placeholder="Enter your search"
        self.definesPresentationContext=true
        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false
        let stockRequest = StockRequest()
        stockRequest.getStocks(){[weak self] result in
            switch result {
            case .failure(let error):
                print (error)
            case .success(let stocks):
                self?.listOfStock=stocks
            }
        }
       
      
    }
    func fetchStock(){
       
         
        do {
            StockTableViewController.items = try context.fetch(StockCore.fetchRequest())
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }catch {
            
        }


    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return  1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var res=0
       /* if (isFiltering()){
            res=self.filtereditems?.count ?? 0
        }else {
        
            res=StockTableViewController.items?.count ?? 0
         }
       */
        res=StockTableViewController.items?.count ?? 0
        //print(listOfStock.count)
      //  return  listOfStock.count
        return res
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "stock") as! StockTableViewCell

      /*  var Stock1:StockCore
     
             if (isFiltering()){
             Stock1 = self.filtereditems![indexPath.row]
        }else{
            Stock1 = StockTableViewController.items![indexPath.row]
        }
       */
         var Stock1 = StockTableViewController.items![indexPath.row]
             //let stock=listOfStock[indexPath.row]
        
       // cell.Name.text=stock.T
        
        cell.Name.text=Stock1.name
          return (cell)
      }


    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let toRemove = StockTableViewController.items![indexPath.row]
            self.context.delete(toRemove)
            do {
                try self.context.save()
            }catch{
                
            }
            self.fetchStock()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        StockTableViewController.choosedStock=StockTableViewController.items![indexPath.row]

        }


}

/*extension StockTableViewController :UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchBarText = searchBar.text else{
            return
        }
        let stockRequest = StockRequest()
        stockRequest.getStocks{[weak self] result in
            switch result {
            case .failure(let error):
                print (error)
            case .success(let stocks):
                self?.listOfStock=stocks
            }
        }
    }
}*/

