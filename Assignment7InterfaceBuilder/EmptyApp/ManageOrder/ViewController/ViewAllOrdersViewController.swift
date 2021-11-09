//
//  ViewAllOrdersViewController.swift
//  EmptyApp
//
//  Created by Yining Chen on 11/8/21.
//  Copyright © 2021 rab. All rights reserved.
//

import UIKit

class ViewAllOrdersViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {

    @IBOutlet weak var closeWindow: UIButton!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "ViewCell", bundle: nil)
        tableView.register(nib,
                                 forCellReuseIdentifier: "CustomeTableViewSell")
        tableView.dataSource = self
        tableView.delegate = self



}
    //Table View
    func tableView(_ tableView: UITableView,numberOfRowsInSection section:Int)->Int{
      
        return (AppDelegate.GlobalVariable.orderlist.testOrderlist.getsize())
      }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "CustomeTableViewSell") as! ViewOwnedStocksTableViewCell
        print(AppDelegate.GlobalVariable.orderlist.testOrderlist.toString()[indexPath.row])
        let str=AppDelegate.GlobalVariable.orderlist.testOrderlist.toString()[indexPath.row]
        let components = str.components(separatedBy: " ")
        cell.name.text = components[0]
        cell.StockName.text=components[1]
        cell.Quantity.text=components[2]
        cell.Date.text=components[3]+components[4]
        
        return cell
        
    }
    

    @IBAction func closeWindow(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    /*
       let cell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "CustomeTableViewSell")
    cell.textLabel?.text = "Hello World"
    // AppDelegate.GlobalVariable.orderlist.testOrderlist.toString()[indexPath.row]
       return (cell)
    */
}
