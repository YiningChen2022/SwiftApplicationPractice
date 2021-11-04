//
//  SearchByNameViewController.swift
//  EmptyApp
//
//  Created by Yining Chen on 11/4/21.
//  Copyright © 2021 rab. All rights reserved.
//

import UIKit

class SearchByNameViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var nameField: UITextField!
    var name=""
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    //Table View
    func tableView(_ tableView: UITableView,numberOfRowsInSection section:Int)->Int{
      
        name=nameField.text ?? ""
        return (AppDelegate.GlobalVariable.stocklist.testStocklist.searchNamegetsize(name: name))
      }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
      
          let cell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
       cell.textLabel?.text = AppDelegate.GlobalVariable.stocklist.testStocklist.searchByName(name: name)[indexPath.row]
          return (cell)
      }

    @IBAction func didtapSearch(_ sender: UIButton) {
        DispatchQueue.main.async {
            self.tableView.register(UITableViewCell.self,
                                 forCellReuseIdentifier: "AnimalCell")
            self.tableView.dataSource = self
            self.tableView.delegate = self
        }
        
    }
    
    @IBAction func Close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
    
    }
    
}
