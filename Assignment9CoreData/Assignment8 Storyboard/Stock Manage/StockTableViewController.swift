//
//  StockTableViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/14/21.
//

import UIKit
import CoreData
class StockTableViewController: UITableViewController, UISearchResultsUpdating,UISearchBarDelegate {
    var context: NSManagedObjectContext=(UIApplication.shared.delegate as! AppDelegate).managedObjectContext!

    var items:[StockCore]?
    public static var choosedStock: StockCore?
    let request = StockCore.fetchRequest() as NSFetchRequest<StockCore>
    
    var filteredObjects:[String]=[String]()
    var searchController = UISearchController(searchResultsController:nil)
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {return }
    
       
        filterContentForSearchText(text)
    }
    func filterContentForSearchText (_ searchText:String){
        let pred=NSPredicate(format: "name CONTAINS %@",searchText)
        request.predicate=pred
        tableView.reloadData()
    }
    func isFiltering()->Bool{
        return searchController.isActive && !(searchController.searchBar.text?.isEmpty)!
    }
    public func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        let text=searchBar.text
        filterContentForSearchText(text!)
    }
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchStock()
        self.navigationItem.leftBarButtonItem=self.editButtonItem
        
        navigationItem.searchController=searchController
        searchController.searchBar.delegate=self
        searchController.searchResultsUpdater=self
        searchController.obscuresBackgroundDuringPresentation=false
        searchController.searchBar.placeholder="Enter your search"
        self.definesPresentationContext=true
        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false
      
    }
    func fetchStock(){
       
         
        do {
            self.items = try context.fetch(request)
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
        if (isFiltering()){
            self.items?.count ?? 0
        }else {
            self.items?.count ?? 0
        }
       
        return  self.items?.count ?? 0
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "stock") as! StockTableViewCell

        //var str=""
     
            /* if (isFiltering()){
            let Stock1 = self.items![indexPath.row]
        }else{
            let Stock1 = self.items![indexPath.row]
        }*/
        let Stock1 = self.items![indexPath.row]
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
            let toRemove = self.items![indexPath.row]
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
        StockTableViewController.choosedStock=self.items![indexPath.row]

        }


}

