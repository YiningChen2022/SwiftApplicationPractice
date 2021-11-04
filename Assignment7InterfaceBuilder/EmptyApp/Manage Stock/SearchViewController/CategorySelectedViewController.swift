//
//  CategorySelectedViewController.swift
//  EmptyApp
//
//  Created by Yining Chen on 11/4/21.
//  Copyright © 2021 rab. All rights reserved.
//

import UIKit

class CategorySelectedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

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
        
        return (AppDelegate.GlobalVariable.stocklist.testStocklist.searchCategorygetsize(categoryid: AppDelegate.GlobalVariable.selectedCategorySearch))
      }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
      
          let cell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
       cell.textLabel?.text = AppDelegate.GlobalVariable.stocklist.testStocklist.searchByCategory(categoryid: AppDelegate.GlobalVariable.selectedCategorySearch)[indexPath.row]
          return (cell)
      }


    @IBAction func Close(_ sender: UIButton) {
        let vc = ViewAllStockViewController()
            self.present(vc, animated: true, completion: nil)
        
    }
    
}
