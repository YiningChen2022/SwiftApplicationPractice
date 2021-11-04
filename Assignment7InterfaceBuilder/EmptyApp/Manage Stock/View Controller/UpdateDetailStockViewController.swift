//
//  UpdateDetailStockViewController.swift
//  EmptyApp
//
//  Created by Yining Chen on 11/3/21.
//  Copyright © 2021 rab. All rights reserved.
//

import UIKit

class UpdateDetailStockViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var lasttradefield: UITextField!
    
    
    @IBOutlet weak var Ratingfield: UITextField!
    
    @IBOutlet weak var tableView2: UITableView!
    @IBOutlet weak var tableView1: UITableView!
    var selectedCompanyid=0
    var selectedCategoryid=0
    let id = AppDelegate.GlobalVariable.selectedStock

    override func viewDidLoad() {
        let currentStock=AppDelegate.GlobalVariable.stocklist.testStocklist.getStock(id: id)
        nameField.text=currentStock?.getName()
        nameField.isEnabled=false

        lasttradefield.text = currentStock?.getlastTradePrice().description
        Ratingfield.text=currentStock?.getfinancialRating().description
        
        super.viewDidLoad()
        tableView2.register(UITableViewCell.self,
                                 forCellReuseIdentifier: "cellCate")
        tableView2.dataSource = self
        tableView2.delegate = self
        
     
        

        tableView1.register(UITableViewCell.self,
                                 forCellReuseIdentifier: "cellCom")
        tableView1.dataSource = self
        tableView1.delegate = self
        // Do any additional setup after loading the view.
    }
    //Table View
    func tableView(_ tableView: UITableView,numberOfRowsInSection section:Int)->Int{
        if (tableView == tableView1){
            return AppDelegate.GlobalVariable.companylist.testCompanylist.getsize()
        }else{
        return (AppDelegate.GlobalVariable.categorylist.testCategorylist.getsize())
      }
    }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
       if (tableView == self.tableView1){
           let cell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cellCom")
           cell.textLabel?.text = AppDelegate.GlobalVariable.companylist.testCompanylist.toString()[indexPath.row]
           return (cell)
       }else{
           let cell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
           cell.textLabel?.text = AppDelegate.GlobalVariable.categorylist.testCategorylist.toString()[indexPath.row]
           return (cell)
       }
        
      }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let currentStock=AppDelegate.GlobalVariable.stocklist.testStocklist.getStock(id: id)
        if (tableView == self.tableView1){
    
            let selected = AppDelegate.GlobalVariable.companylist.testCompanylist.toString()[indexPath.row]
            selectedCompanyid=Int(selected.split(separator: " ")[0])!
            if (selectedCompanyid == 0){
                selectedCompanyid=(currentStock?.getCompany().getid())!
            }
            
        }else{
            let selected = AppDelegate.GlobalVariable.categorylist.testCategorylist.toString()[indexPath.row]
            selectedCategoryid=Int(selected.split(separator: " ")[0])!
            if selectedCategoryid == 0 {
                selectedCategoryid = (currentStock?.getCategory().getId())!
            }
        }
    
    }
    
    @IBAction func didTapUpdate(_ sender: UIButton) {
        guard
              let lastTrade=lasttradefield.text,  Double(lastTrade) != nil,
              let Fincial=Ratingfield.text,  Int(Fincial) != nil
              
        else{
                  return Alert()
              }
        let company = AppDelegate.GlobalVariable.companylist.testCompanylist.getCompany(id: selectedCompanyid)
        
        let category = AppDelegate.GlobalVariable.categorylist.testCategorylist.getCategory(id: selectedCategoryid)
        AppDelegate.GlobalVariable.stocklist.testStocklist.UpdateStock(id: AppDelegate.GlobalVariable.selectedStock, company:company , lastTradePrice: Double(lastTrade), financialRating: Int(Fincial), Category: category)
    
        let vc = ManageStockViewController()
           self.present(vc, animated: true, completion: nil)
    
        
    }
    func Alert (){
        
        let alertController = UIAlertController(title:"Info",message:"Valid input", preferredStyle:  .alert)
        let OKAction = UIAlertAction(title: "OK", style:  .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController,animated:true,completion: nil)
    }

    
    @IBAction func didName(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func closewindow(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
