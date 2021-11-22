//
//  ViewAllOrderTableViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/16/21.
//

import UIKit
import CoreData
class ViewAllOrderTableViewController: UITableViewController {
    var context: NSManagedObjectContext=(UIApplication.shared.delegate as! AppDelegate).managedObjectContext!
    public static var items=AppDelegate.GlobalVariable.OrderCoreitems
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    //Table View
    override func tableView(_ tableView: UITableView,numberOfRowsInSection section:Int)->Int{
      
        return ViewAllOrderTableViewController.items?.count ?? 0
      }

   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // #warning Incomplete implementation, return the number of rows
        let cell = tableView.dequeueReusableCell(withIdentifier: "order") as! OrderTableViewCell
        
       let Order = ViewAllOrderTableViewController.items![indexPath.row]
     
       cell.id.text = Order.id?.description
       cell.stocks.text=Order.ofStock?.description
       cell.quantities.text=Order.quantity?.description
       cell.Date.text=Order.date?.description
         
         return cell
       }
   

}
