//
//  ViewAllOrderTableViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/16/21.
//

import UIKit
import CoreData
class ViewAllOrderTableViewController: UITableViewController {
    var customerarr:[String]=[]
  
    var context: NSManagedObjectContext=(UIApplication.shared.delegate as! AppDelegate).managedObjectContext!
    public static var items=AppDelegate.GlobalVariable.OrderCoreitems
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem=self.editButtonItem
        
        fetchOrder()
    }
    
    @IBAction func refres(_ sender: Any) {
        self.tableView.reloadData()
    }
    
    func fetchOrder(){
        do {
            ViewAllOrderTableViewController.items = try context.fetch(OrderCore.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }catch {
            
        }

    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }
    //Table View
    override func tableView(_ tableView: UITableView,numberOfRowsInSection section:Int)->Int{
        return ViewAllOrderTableViewController.items?.count ?? 0
      }

   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "order") as! OrderTableViewCell
       
       let Order = ViewAllOrderTableViewController.items![indexPath.row]
     
       var str=""
       for item in Order.ofCustomer!.allObjects as! [CustomerCore] {
           str="\(item.firstName!)"
          
          
       }

       var stockarr:[String]=[]
    
       let stocklist = Array(Order.ofStock!) as! [StockCore]
     
       for (index,stock ) in stocklist.enumerated() {
           stockarr.append(stock.name!)
       }
      
       print( stockarr.description)
       cell.id.text = str
       cell.stocks.text=stockarr.description
       cell.quantities.text=Order.quantity?.description
       cell.Date.text=Order.date?.description
         
         return cell
       }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
      
      
       
        
       
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let toRemove = ViewAllOrderTableViewController.items![indexPath.row]
            self.context.delete(toRemove)
            do {
                try self.context.save()
            }catch{
                
            }
            self.fetchOrder()
        
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    

}
