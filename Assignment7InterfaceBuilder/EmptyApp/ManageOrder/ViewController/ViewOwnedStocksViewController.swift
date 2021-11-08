//
//  ViewOwnedStocksViewController.swift
//  EmptyApp
//
//  Created by Yining Chen on 11/8/21.
//  Copyright © 2021 rab. All rights reserved.
//

import UIKit

class ViewOwnedStocksViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

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
        print((AppDelegate.GlobalVariable.orderlist.testOrderlist.getsizeofStock(customer: customer!)))
        return (AppDelegate.GlobalVariable.orderlist.testOrderlist.getsizeofStock(customer: customer!))
      }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
       let customer = AppDelegate.GlobalVariable.customerlist.testcustomerlist.getCustomer(id: AppDelegate.GlobalVariable.selectedOrderid)
          let cell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
       cell.textLabel?.text = AppDelegate.GlobalVariable.orderlist.testOrderlist.toStringStock(customer: customer!)[indexPath.row]
          return (cell)
      }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let customer = AppDelegate.GlobalVariable.customerlist.testcustomerlist.getCustomer(id: AppDelegate.GlobalVariable.selectedOrderid)
         
        let selected = AppDelegate.GlobalVariable.orderlist.testOrderlist.toStringStock(customer: customer!)[indexPath.row]
        let id=Int(selected.split(separator: " ")[0])!
        AppDelegate.GlobalVariable.sellStockid=id
        DispatchQueue.main.async {
            let vc = SellStockViewController()
               self.present(vc, animated: true, completion: nil)
           }
   
        }
    

    @IBAction func closewindow(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
