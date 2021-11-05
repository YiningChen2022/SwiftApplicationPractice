//
//  DeleteCustomerViewController.swift
//  EmptyApp
//
//  Created by Yining Chen on 11/3/21.
//  Copyright © 2021 rab. All rights reserved.
//

import UIKit

class DeleteCustomerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

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
        print(id)
        
      
        
        let alert = UIAlertController(title: "Are you sure?", message: "Delete this Customer", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: .cancel, handler: {_ in self.delete(Id:id);DispatchQueue.main.async {   let vc = ManageCustomerViewController()
            self.present(vc, animated: true, completion: nil)}}))
        self.present(alert,animated:true,completion: nil)
        
        
        
    }
        
        
        
       
    
       public func delete(Id:Int){
           AppDelegate.GlobalVariable.customerlist.testcustomerlist.DeleteCustomer(id: Id)
           
       }
    
    @IBAction func CloseWindow(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
