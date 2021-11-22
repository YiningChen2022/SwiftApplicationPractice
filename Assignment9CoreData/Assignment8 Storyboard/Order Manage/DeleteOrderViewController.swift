//
//  DeleteOrderViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/16/21.
//

import UIKit
import CoreData
class DeleteOrderViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    let customer = ViewCustomerTableViewController.choosedCustomer
    var selectedcustomer:CustomerCore?
    var context: NSManagedObjectContext=(UIApplication.shared.delegate as! AppDelegate).managedObjectContext!
   
    var items:[OrderCore]?
  
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self,
                                 forCellReuseIdentifier: "AnimalCell")
        tableView.dataSource = self
        tableView.delegate = self
        fetchOrderbyCustomer()

        // Do any additional setup after loading the view.
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

       var stockarrname:[String]=[]
          let cell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
       let Order=items![indexPath.row]
       var str=""
       for item in Order.ofCustomer!.allObjects as! [CustomerCore] {
           str="\(item.firstName!) \(item.lastName!)"
          
          
       }
       for item in Order.ofStock!.allObjects as! [StockCore] {
           stockarrname.append("\(item.name!)")
          
          
       }
       cell.textLabel?.text = " \(stockarrname.description) \(Order.quantity!.description) \(Order.date!.description)"
          return (cell)
      }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
      
        let selected = self.items! [indexPath.row]
     
        let alert = UIAlertController(title: "Are you sure?", message: "Delete this Order", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: .cancel, handler: {_ in self.delete(selected: selected);DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
            
        }}))
        self.present(alert,animated:true,completion: nil)
        
       
    }
    public func delete(selected: OrderCore){
        var stockarr:[Double]=[]
           //if order been deleted, deleted the invested money as well
        
        for item in selected.ofStock!.allObjects as! [StockCore] {
            stockarr.append(item.lastTradePrice)
        }
        
        var investment=0.0
        for (index,stock) in stockarr.enumerated(){
            investment+=stockarr[index]*Double(selected.quantity![index])
        }
        
        for item in selected.ofCustomer?.allObjects as![CustomerCore]{
            selectedcustomer=item
        }
        let total=selectedcustomer!.totalInvestment
        selectedcustomer!.totalInvestment=total-investment
        do {
            try! self.context.save()
            
        }catch{
            
        }
        self.context.delete(selected)
    
                
    }
}
