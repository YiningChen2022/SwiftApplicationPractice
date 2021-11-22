//
//  ViewCustomerOrderViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/16/21.
//

import UIKit
import CoreData
class ViewCustomerOrderViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource{    var context: NSManagedObjectContext=(UIApplication.shared.delegate as! AppDelegate).managedObjectContext!
    let customer = ViewCustomerTableViewController.choosedCustomer
    var items:[OrderCore]?
 
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var Stock: UILabel!
    
    @IBOutlet weak var quantity: UILabel!
    
    @IBOutlet weak var Date: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self,
                                 forCellReuseIdentifier: "AnimalCell")
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
        fetchOrderbyCustomer()
    }
    
    
    func fetchOrderbyCustomer(){
        do{
            
        let request = OrderCore.fetchRequest() as NSFetchRequest<OrderCore>
        
            let pred=NSPredicate(format: "ofCustomer.firstName CONTAINS[cd] %@", customer!.firstName!)
        request.predicate=pred
            
            self.items = try context.fetch(request)
            
            DispatchQueue.main.async {
               // self.tableView.reloadData()
            }
        }catch {
            
        }


    }
    //Table View
    func tableView(_ tableView: UITableView,numberOfRowsInSection section:Int)->Int{
        
        return  items?.count ?? 0
      }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
     
          let cell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
       let Order=items![indexPath.row]
       var str=""
       for item in Order.ofCustomer!.allObjects as! [CustomerCore] {
           str="\(item.firstName!) \(item.lastName!)"
          
          
       }
       var stockarr:[String]=[]
       for item in Order.ofStock!.allObjects as! [StockCore] {
           stockarr.append("\(item.name!)")
       }
       cell.textLabel?.text = " \(stockarr.description) \(Order.quantity!.description) \(Order.date!.description)"
          return (cell)
      }

}
