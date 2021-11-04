//
//  ViewAllStockViewController.swift
//  EmptyApp
//
//  Created by Yining Chen on 11/3/21.
//  Copyright © 2021 rab. All rights reserved.
//

import UIKit

class ViewAllStockViewController: UIViewController,UITableViewDelegate, UITableViewDataSource  {
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
        
        return (AppDelegate.GlobalVariable.stocklist.testStocklist.getsize())
      }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
      
          let cell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
       cell.textLabel?.text = AppDelegate.GlobalVariable.stocklist.testStocklist.toString()[indexPath.row]
          return (cell)
      }
    @IBAction func CloseWindow(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didtapsearchComp(_ sender: UIButton) {
        let vc = SearchByCompanyViewController()
           self.present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func didtapsearchcate(_ sender: UIButton) {
        let vc = SearchByCategoryViewController()
           self.present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func didtapseachlastrade(_ sender: UIButton) {
        let vc = SearchByLastTradePriceViewController()
           self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func didtapsearchname(_ sender: UIButton) {
        let vc = SearchByNameViewController()
           self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func didtapsearchfinancial(_ sender: UIButton) {
        let vc = SearchByFinancialRatingViewController()
           self.present(vc, animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
    
    
}
