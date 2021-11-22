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
        fetchOrder()
    }
    
    func fetchOrder(){
        do {
            ViewAllOrderTableViewController.items = try context.fetch(OrderCore.fetchRequest())
            DispatchQueue.main.async {
                //self.tableView.reloadData()
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
       cell.Date.text=Order.date!.description
         
         return cell
       }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
      
        let selected = ViewAllOrderTableViewController.items! [indexPath.row]
     
        let alert = UIAlertController(title: "Are you sure?", message: "Delete this Order", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: .cancel, handler: {_ in self.delete(selected: selected);DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
            
        }}))
        self.present(alert,animated:true,completion: nil)
        
       
    }
    public func delete(selected: OrderCore){
           //if order been deleted, deleted the invested money as well
           self.context.delete(selected)
    }
    

}
