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
      var items:[OrderCore]?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchOrderbyStock()
      
    }
    func fetchOrderbyStock(){
        do{
            
        let request = OrderCore.fetchRequest() as NSFetchRequest<OrderCore>
        
            let pred=NSPredicate(format: "ofStock.name CONTAINS[cd] %@", customer!.firstName!)
        request.predicate=pred
            
            self.items = try context.fetch(request)
            
            DispatchQueue.main.async {
               // self.tableView.reloadData()
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
        return (AppDelegate.GlobalVariable.orderlist.testOrderlist.getsizeofStock(customer: customer!))
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let customer = AppDelegate.GlobalVariable.customerlist.testcustomerlist.getCustomer(id: AppDelegate.GlobalVariable.selectedOrderid)
         
        let selected = AppDelegate.GlobalVariable.orderlist.testOrderlist.toStringStock(customer: customer!)[indexPath.row]
        let id=Int(selected.split(separator: " ")[0])!
        AppDelegate.GlobalVariable.sellStockid=id
        
        
       /* DispatchQueue.main.async {
            let vc = SellStockViewController()
               self.present(vc, animated: true, completion: nil)
           }
        */
   
        }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
      
       /* let cell = UITableViewCell(style:UITableViewCell.CellStyle.subtitle, reuseIdentifier: "Cell")*/
        let cell = tableView.dequeueReusableCell(withIdentifier: "stock") as! StockTableViewCell

        let str=AppDelegate.GlobalVariable.stocklist.testStocklist.toStringShort()[indexPath.row]
        let components = str.components(separatedBy: " ")
        cell.Name .text = components[0]+" "+components[1]
        cell.pricce.text=components[2]
        cell.rating.text=components[3]

          return (cell)
      }

   

}
