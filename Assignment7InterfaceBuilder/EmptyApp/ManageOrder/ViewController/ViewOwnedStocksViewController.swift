//
//  ViewOwnedStocksViewController.swift
//  EmptyApp
//
//  Created by Yining Chen on 11/8/21.
//  Copyright © 2021 rab. All rights reserved.
//

import UIKit

class ViewOwnedStocksViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let customer = AppDelegate.GlobalVariable.customerlist.testcustomerlist.getCustomer(id: AppDelegate.GlobalVariable.selectedOrderid)
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "ViewOwnedStockcell", bundle: nil)
        tableView.register(nib,
                                 forCellReuseIdentifier: "ownstocks")
        tableView.dataSource = self
        tableView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    //Table View
    func tableView(_ tableView: UITableView,numberOfRowsInSection section:Int)->Int{
        
        return (AppDelegate.GlobalVariable.orderlist.testOrderlist.getsizeofStock(customer: customer!))
      }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "ownstocks") as! ViewOwnedStockTableViewCell
        let str=AppDelegate.GlobalVariable.stocklist.testStocklist.toStringShort()[indexPath.row]
        let components = str.components(separatedBy: " ")
        cell.id.text = components[0]
        cell.naem.text=components[1]
        cell.trade.text=components[2]
        cell.rating.text=components[3]
        
        return cell
        
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
