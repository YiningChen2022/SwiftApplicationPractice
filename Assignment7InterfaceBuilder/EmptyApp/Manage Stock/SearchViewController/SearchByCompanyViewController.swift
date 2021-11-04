//
//  SearchByCompanyViewController.swift
//  EmptyApp
//
//  Created by Yining Chen on 11/4/21.
//  Copyright © 2021 rab. All rights reserved.
//

import UIKit

class SearchByCompanyViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

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
        AppDelegate.GlobalVariable.selectedCompanytoSearch=id
        DispatchQueue.main.async {
            let vc = CompanySelectedViewController()
                self.present(vc, animated: true, completion: nil)
        }
    }
    
   
 
       
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func closeWindow(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
