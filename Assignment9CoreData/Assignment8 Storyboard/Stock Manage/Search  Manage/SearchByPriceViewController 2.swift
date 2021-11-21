//
//  SearchByPriceViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/16/21.
//

import UIKit

class SearchByPriceViewController:UIViewController, UITableViewDelegate, UITableViewDataSource  {
    var name=""
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapSearch(_ sender: Any) {
        
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
