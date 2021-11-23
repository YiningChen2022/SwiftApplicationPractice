//
//  ViewOwnStockTableViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/16/21.
//

import UIKit
import CoreData
class ViewOwnStockTableViewController: UITableViewController {
    var context: NSManagedObjectContext=(UIApplication.shared.delegate as! AppDelegate).managedObjectContext!
      let customer = ViewCustomerTableViewController.choosedCustomer
      var items:[StockCore]?
    let orderlist=ViewAllOrderTableViewController.items
    override func viewDidLoad() {
        super.viewDidLoad()
       
        fetchStockByCustomer()
      
    }
    func fetchStockByCustomer(){
      
        var stockarr:Array<StockCore>=[]
        var res:Array<String>=[]
        
        for order in orderlist!{
            for item in order.ofCustomer!.allObjects as! [CustomerCore] {
                if (item.isEqual(customer)){
                    for item in order.ofStock!.allObjects as! [StockCore] {
                        stockarr.append(item)
                    }
                }
            }
            for s in stockarr{
                if !res.contains(s.name!){
                    res.append(s.name!)
                    
                }
            }
        }
        print(res.description)
       do{
           var predList=[NSPredicate]()
           let request = StockCore.fetchRequest() as NSFetchRequest<StockCore>
           for str in res{
               let pred=NSPredicate(format: "name CONTAINS[cd] %@", str )
               predList.append(pred)
           
           }
           let andPredicate = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.or, subpredicates: predList)
           request.predicate=andPredicate
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
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.items?.count ?? 0
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let customer = AppDelegate.GlobalVariable.customerlist.testcustomerlist.getCustomer(id: AppDelegate.GlobalVariable.selectedOrderid)
         
        let selected = AppDelegate.GlobalVariable.orderlist.testOrderlist.toStringStock(customer: customer!)[indexPath.row]
        let id=Int(selected.split(separator: " ")[0])!
        AppDelegate.GlobalVariable.sellStockid=id
        
 
   
        }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
      
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "stock") as! StockTableViewCell
        let Stock1 = StockTableViewController.items![indexPath.row]
        
       
        cell.Name .text = Stock1.name
        cell.pricce.text=Stock1.lastTradePrice.description
        cell.rating.text=Stock1.financialRating.description

          return (cell)
      }

   

}
