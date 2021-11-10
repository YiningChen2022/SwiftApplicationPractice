//
//  CompanySelectedViewController.swift
//  EmptyApp
//
//  Created by Yining Chen on 11/4/21.
//  Copyright © 2021 rab. All rights reserved.
//

import UIKit

class CompanySelectedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tabelView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelView.register(UITableViewCell.self,
                                 forCellReuseIdentifier: "AnimalCell")
        tabelView.dataSource = self
        tabelView.delegate = self
     
    }
    
    //Table View
    func tableView(_ tableView: UITableView,numberOfRowsInSection section:Int)->Int{
        return (AppDelegate.GlobalVariable.stocklist.testStocklist.searchCompanygetsize(Companyid:AppDelegate.GlobalVariable.selectedCompanytoSearch))
      }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
      
          let cell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
       cell.textLabel?.text = AppDelegate.GlobalVariable.stocklist.testStocklist.searchByCompany(Companyid: AppDelegate.GlobalVariable.selectedCompanytoSearch)[indexPath.row]
          return (cell)
      }
    
    
    
    @IBAction func closewindow(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
    }
    

}
