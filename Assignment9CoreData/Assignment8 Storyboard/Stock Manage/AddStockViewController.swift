//
//  AddStockViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/15/21.
//

import UIKit

class AddStockViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var selectedCompanyid=0
    var selectedCategoryid=0
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var tradeField: UITextField!
    
    @IBOutlet weak var ratingField: UITextField!
    
    @IBOutlet weak var tableviewCompany: UITableView!
    
    @IBOutlet weak var tableviewCategory: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableviewCategory.register(UITableViewCell.self,
                                    forCellReuseIdentifier: "cellCate")
        tableviewCategory.dataSource = self
        tableviewCategory.delegate = self
        tableviewCompany.register(UITableViewCell.self,
                                 forCellReuseIdentifier: "cellCom")
        tableviewCompany.dataSource = self
        tableviewCompany.delegate = self
        // Do any additional setup after loading the view.
    }
    //Table View
    func tableView(_ tableView: UITableView,numberOfRowsInSection section:Int)->Int{
        if (tableView == tableviewCompany){
            return AppDelegate.GlobalVariable.companylist.testCompanylist.getsize()
        }else{
        return (AppDelegate.GlobalVariable.categorylist.testCategorylist.getsize())
      }
    }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
       if (tableView == self.tableviewCompany){
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
        if (tableView == self.tableviewCompany){
            let selected = AppDelegate.GlobalVariable.companylist.testCompanylist.toString()[indexPath.row]
            selectedCompanyid=Int(selected.split(separator: " ")[0])!
            print(selectedCompanyid)
        }else{
            let selected = AppDelegate.GlobalVariable.categorylist.testCategorylist.toString()[indexPath.row]
            selectedCategoryid=Int(selected.split(separator: " ")[0])!
            print(selectedCategoryid)
        }
    
    }

    
    @IBAction func didTapAdd(_ sender: UIButton) {
        guard let name=nameField.text, !name.isEmpty,
              let lastTrade=tradeField.text, !lastTrade.isEmpty, Double(lastTrade) != nil ,Double(lastTrade)!>=0,
              let Fincial=ratingField.text, !Fincial.isEmpty, Int(Fincial) != nil,Int(Fincial)!>=1 , Int(Fincial)!<11,
              selectedCompanyid != 0,
              selectedCategoryid != 0
        else{
                  return Alert()
              }
        let currcate=AppDelegate.GlobalVariable.categorylist.testCategorylist.getCategory(id: selectedCategoryid)
        let currcomp = AppDelegate.GlobalVariable.companylist.testCompanylist.getCompany(id: selectedCompanyid)
        let Stock = Stock(name: name, lastTradePrice: Double(lastTrade)!, financialRating: Int(Fincial)!, category: currcate! , company: currcomp!)
        AppDelegate.GlobalVariable.stocklist.testStocklist.addStock(Stock: Stock)

    }
    func Alert (){
        
        let alertController = UIAlertController(title:"Info",message:"Valid input", preferredStyle:  .alert)
        let OKAction = UIAlertAction(title: "OK", style:  .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController,animated:true,completion: nil)
    }
}
