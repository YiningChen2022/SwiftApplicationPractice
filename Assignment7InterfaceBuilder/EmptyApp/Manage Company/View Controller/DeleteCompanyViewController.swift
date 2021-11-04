//
//  DeleteCompanyViewController.swift
//  EmptyApp
//
//  Created by Yining Chen on 11/3/21.
//  Copyright © 2021 rab. All rights reserved.
//

import UIKit

class DeleteCompanyViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{

  
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
        
        return (AppDelegate.GlobalVariable.companylist.testCompanylist.getsize())
                   
      }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
      
          let cell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
       cell.textLabel?.text = AppDelegate.GlobalVariable.companylist.testCompanylist.toString()[indexPath.row]
          return (cell)
      }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let selected = AppDelegate.GlobalVariable.companylist.testCompanylist.toString()[indexPath.row]
        let id=Int(selected.split(separator: " ")[0])!
       
        let alert = UIAlertController(title: "Are you sure?", message: "Delete this Company", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: .cancel, handler: {_ in self.delete(Id:id);DispatchQueue.main.async {
            let vc = ManageCompanyViewController()
                self.present(vc, animated: true, completion: nil)}}))
        self.present(alert,animated:true,completion: nil)
        
      
        
       
    }
       public func delete(Id:Int){
           AppDelegate.GlobalVariable.companylist.testCompanylist.DeleteCompany(id: Id)
           
       }
 
    @IBAction func CloseWindow(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
