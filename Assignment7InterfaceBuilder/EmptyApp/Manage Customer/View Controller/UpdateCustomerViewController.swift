//
//  UpdateCustomerViewController.swift
//  EmptyApp
//
//  Created by Yining Chen on 11/3/21.
//  Copyright © 2021 rab. All rights reserved.
//

import UIKit

class UpdateCustomerViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self,
                                 forCellReuseIdentifier: "AnimalCell")
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    //Table View
    func tableView(_ tableView: UITableView,numberOfRowsInSection section:Int)->Int{
        
        return (AppDelegate.GlobalVariable.customerlist.testcustomerlist.getsize())
      }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
      
          let cell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
       cell.textLabel?.text = AppDelegate.GlobalVariable.customerlist.testcustomerlist.toString()[indexPath.row]
          return (cell)
      }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
         let selected = AppDelegate.GlobalVariable.customerlist.testcustomerlist.toString()[indexPath.row]
        let id=Int(selected.split(separator: " ")[0])!
        AppDelegate.GlobalVariable.selected=id
        DispatchQueue.main.async {
         let vc = UpdateDetailCustomerViewController()
            self.present(vc, animated: true, completion: nil)
        }
       
        
    }
    
    
    
    @IBAction func CloseWindow(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
