//
//  SearchByratingViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/16/21.
//

import UIKit

class SearchByratingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameField: UITextField!
    var name=""
    var rate=0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapSearch(_ sender: UIButton) {
        DispatchQueue.main.async {
            self.tableView.register(UITableViewCell.self,
                                 forCellReuseIdentifier: "AnimalCell")
            self.tableView.dataSource = self
            self.tableView.delegate = self
        }
    }
    //Table View
    func tableView(_ tableView: UITableView,numberOfRowsInSection section:Int)->Int{
      
        name=nameField.text ?? ""
        if (Int(name) == nil){
            print ("not valid")
            return 0
        }else {
            rate=Int(name)!
        
       
       
      
        return AppDelegate.GlobalVariable.stocklist.testStocklist.searchFinancialgetsize(financialRating:rate)
        }
      }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
      
          let cell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
       cell.textLabel?.text = AppDelegate.GlobalVariable.stocklist.testStocklist.searchByFinancialRating(financialRating: rate)[indexPath.row]
          return (cell)
      }
    



}
