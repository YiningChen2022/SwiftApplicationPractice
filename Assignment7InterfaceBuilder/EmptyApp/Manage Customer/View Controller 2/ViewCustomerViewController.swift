//
//  ViewCustomerViewController.swift
//  EmptyApp
//
//  Created by Yining Chen on 11/3/21.
//  Copyright © 2021 rab. All rights reserved.
//

import UIKit

class ViewCustomerViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var TableView: UITableView!
    //Table View
    func tableView(_ tableView: UITableView,numberOfRowsInSection section:Int)->Int{
        
        return (AppDelegate.GlobalVariable.customerlist.testcustomerlist.getsize())
      }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
      
          let cell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
       cell.textLabel?.text = AppDelegate.GlobalVariable.customerlist.testcustomerlist.toString()[indexPath.row]
          return (cell)
      }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        TableView.register(UITableViewCell.self,
                                 forCellReuseIdentifier: "AnimalCell")
       TableView.dataSource = self
       TableView.delegate = self

        // Do any additional setup after loading the view.
    }
    
   
    
    @IBAction func closeWindow(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
