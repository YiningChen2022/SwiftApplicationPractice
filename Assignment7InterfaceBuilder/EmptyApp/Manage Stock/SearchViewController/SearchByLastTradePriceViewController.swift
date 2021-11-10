//
//  SearchByLastTradePriceViewController.swift
//  EmptyApp
//
//  Created by Yining Chen on 11/4/21.
//  Copyright © 2021 rab. All rights reserved.
//

import UIKit

class SearchByLastTradePriceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var name=""
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeWindow(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapSearch(_ sender: UIButton) {
        DispatchQueue.main.async {
            self.tableView.register(UITableViewCell.self,
                                 forCellReuseIdentifier: "cell")
            self.tableView.dataSource = self
            self.tableView.delegate = self
        }
    }
    //Table View
    func tableView(_ tableView: UITableView,numberOfRowsInSection section:Int)->Int{
      
        name=nameField.text ?? ""
        if (Double(name) == nil){
            print ("not valid")
            return 0
        }else {
           let trade=Double(name)!
        
       
            return (AppDelegate.GlobalVariable.stocklist.testStocklist.searchtradegetsize(lastTradePrice:trade))
        }
      }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
      
          let cell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
       cell.textLabel?.text = AppDelegate.GlobalVariable.stocklist.testStocklist.searchByLastTradePrice(lastTradePrice: Double(name)!)[indexPath.row]
       
          return (cell)
      }
    
    
}
