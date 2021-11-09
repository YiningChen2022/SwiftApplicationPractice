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
        tableView.register(UITableViewCell.self,
                                 forCellReuseIdentifier: "AnimalCell")
        tableView.dataSource = self
        tableView.delegate = self



}
    //Table View
    func tableView(_ tableView: UITableView,numberOfRowsInSection section:Int)->Int{
      
        return (AppDelegate.GlobalVariable.orderlist.testOrderlist.getsize())
      }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
      
          let cell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
       cell.textLabel?.text = AppDelegate.GlobalVariable.orderlist.testOrderlist.toString()[indexPath.row]
          return (cell)
      }

    @IBAction func closeWindow(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
