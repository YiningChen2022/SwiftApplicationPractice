//
//  DeleteOrderViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/16/21.
//

import UIKit

class DeleteOrderViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    let customer = AppDelegate.GlobalVariable.customerlist.testcustomerlist.getCustomer(id: AppDelegate.GlobalVariable.selectedOrderid)
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self,
                                 forCellReuseIdentifier: "AnimalCell")
        tableView.dataSource = self
        tableView.delegate = self

        // Do any additional setup after loading the view.
    }
    

    //Table View
    func tableView(_ tableView: UITableView,numberOfRowsInSection section:Int)->Int{
        let customer = AppDelegate.GlobalVariable.customerlist.testcustomerlist.getCustomer(id: AppDelegate.GlobalVariable.selectedOrderid)
        return (AppDelegate.GlobalVariable.orderlist.testOrderlist.getsize(customer: customer!))
      }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
       let customer = AppDelegate.GlobalVariable.customerlist.testcustomerlist.getCustomer(id: AppDelegate.GlobalVariable.selectedOrderid)
          let cell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
       cell.textLabel?.text = AppDelegate.GlobalVariable.orderlist.testOrderlist.toString(customer: customer!)[indexPath.row]
          return (cell)
      }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
      
        let selected = AppDelegate.GlobalVariable.orderlist.testOrderlist.toString(customer: customer!) [indexPath.row]
        let id=Int(selected.split(separator: " ")[0])!
      
        let alert = UIAlertController(title: "Are you sure?", message: "Delete this Order", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: .cancel, handler: {_ in self.delete(Id:id);DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
            
        }}))
        self.present(alert,animated:true,completion: nil)
        
       
    }
       public func delete(Id:Int){
           //if order been deleted, deleted the invested money as well '
 
           AppDelegate.GlobalVariable.orderlist.testOrderlist.DeleteOrder(id: Id)
       }

}
