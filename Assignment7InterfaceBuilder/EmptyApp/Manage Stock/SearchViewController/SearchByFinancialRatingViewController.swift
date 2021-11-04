//
//  SearchByFinancialRatingViewController.swift
//  EmptyApp
//
//  Created by Yining Chen on 11/4/21.
//  Copyright © 2021 rab. All rights reserved.
//

import UIKit

class SearchByFinancialRatingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBAction func didTapSearch(_ sender: UIButton) {
        DispatchQueue.main.async {
            self.tableView.register(UITableViewCell.self,
                                 forCellReuseIdentifier: "AnimalCell")
            self.tableView.dataSource = self
            self.tableView.delegate = self
        }
        
    }
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameField: UITextField!
    var name=""
    var rate=0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //Table View
    func tableView(_ tableView: UITableView,numberOfRowsInSection section:Int)->Int{
      
        name=nameField.text ?? ""
        rate=Int(name)!
       
      
        return AppDelegate.GlobalVariable.stocklist.testStocklist.searchFinancialgetsize(financialRating:rate)
      }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
      
          let cell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
       cell.textLabel?.text = AppDelegate.GlobalVariable.stocklist.testStocklist.searchByFinancialRating(financialRating: rate)[indexPath.row]
          return (cell)
      }
    

  
    
    
    
    @IBAction func closeWindow(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
