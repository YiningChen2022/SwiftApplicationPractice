//
//  ViewCustomerOrderViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/16/21.
//

import UIKit

class ViewCustomerOrderViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource{

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

}
