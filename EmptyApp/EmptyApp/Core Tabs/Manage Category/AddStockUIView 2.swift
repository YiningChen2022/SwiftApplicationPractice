//
//  AddStockUIView.swift
//  EmptyApp
//
//  Created by Yining Chen on 10/31/21.
//  Copyright © 2021 rab. All rights reserved.
//

import Foundation
import UIKit

class AddStockUIView: UIView, UITableViewDelegate, UITableViewDataSource{
    
    var tableViewCompany:UITableView!
    var tableViewCategory:UITableView!
    var selectedCompanyid=0
    var selectedCategoryid=0
    private let homeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Home", for: .normal )
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action:#selector(gotoHome),for: .touchUpInside)
        button.frame=CGRect.init(x:250,y:40,width:50,height:25)
        return button
    }()
    
    @objc func gotoHome(sender : UIButton) {
        let nextview=MainPage()
        self.addSubview(nextview)
        self.bringSubviewToFront(nextview)

   }
//back button
private let backButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = .systemBlue
    button.setTitle("<Back", for: .normal )
    button.setTitleColor(.white, for: .normal)
    button.addTarget(self, action:#selector(closeWindow),for: .touchUpInside)
    button.frame=CGRect.init(x:20,y:40,width:100,height:25)
    return button
}()
    
    


//FN field
private let nameField: UITextField = {
    let field=UITextField()
    field.leftView=UIView(frame: CGRect(x:0,y:0,width:10,height:50))
    field.leftViewMode = .always
    field.placeholder="Name"
    field.backgroundColor = .lightGray
    field.layer.cornerRadius=8
    field.layer.masksToBounds=true
    field.frame = CGRect(x:60, y:100, width:200,height:30)
    return field
}()


//LN field
private let lasttradeField: UITextField = {
    let field=UITextField()
    field.leftView=UIView(frame: CGRect(x:0,y:0,width:10,height:50))
    field.leftViewMode = .always
    field.placeholder="Last Trade Price"
    field.backgroundColor = .lightGray
    field.layer.cornerRadius=8
    field.layer.masksToBounds=true
    field.frame = CGRect(x:60, y:150, width:200,height:30)
    return field
}()


//Email Field
private let FinancialRatingField: UITextField = {
    let field=UITextField();
    field.keyboardType = .emailAddress
    field.leftView=UIView(frame: CGRect(x:0,y:0,width:10,height:50))
    field.leftViewMode = .always
    field.placeholder="Financial Rating (1 to 10) "
    field.autocapitalizationType = .none
    field.autocorrectionType = .no
    field.backgroundColor = .lightGray
    field.layer.cornerRadius=8
    field.layer.masksToBounds=true
    field.frame = CGRect(x:60, y:200, width:200,height:30)
    return field
}()

    
    //header
    private let labelCompany: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x:25,y:230 ,width: 200,height: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 10, weight: .medium)
        label.text = "Choose Company"
        return label
    }()
    //header
    private let labelCategory: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x:25,y:360 ,width: 200,height: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 10, weight: .medium)
        label.text = "Choose Category"
        return label
    }()


//sign in button
private let AddButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = .systemGreen
    button.setTitle("Add Stock", for: .normal )
    button.setTitleColor(.white, for: .normal)
    button.frame = CGRect(x:60, y:500, width:200,height:30)
    button.addTarget(self, action:#selector(didTapAddStock),for: .touchUpInside)
    return button
}()

override init (frame : CGRect) {
    super.init(frame :  CGRect(x:0, y: 0, width: 350, height: 600))
    backgroundColor = .white
    addSubview(nameField)
    addSubview(lasttradeField)
    addSubview(FinancialRatingField)
    addSubview(backButton)
    addSubview(AddButton)
    addSubview(labelCompany)
    addSubview(labelCategory)
    addSubview(homeButton)
    tableViewCategory = UITableView(frame: CGRect(x: 60, y:380, width: 200, height:100))
    tableViewCategory.register(UITableViewCell.self,
                             forCellReuseIdentifier: "cellCate")
    tableViewCategory.dataSource = self
    tableViewCategory.delegate = self
    
    addSubview(tableViewCategory)
    tableViewCategory.backgroundColor = .white
    
    
    tableViewCompany = UITableView(frame: CGRect(x: 60, y:250, width: 200, height:100))
    tableViewCompany.register(UITableViewCell.self,
                             forCellReuseIdentifier: "cellCom")
    tableViewCompany.dataSource = self
    tableViewCompany.delegate = self
    addSubview(tableViewCompany)
    tableViewCompany.backgroundColor = .white
}

required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}

   



@objc func didTapAddStock(sender : UIButton){
    guard let name=nameField.text, !name.isEmpty,
          let lastTrade=lasttradeField.text, !lastTrade.isEmpty, Double(lastTrade) != nil ,Double(lastTrade)!>=0,
          let Fincial=FinancialRatingField.text, !Fincial.isEmpty, Int(Fincial) != nil,Int(Fincial)!>=1 , Int(Fincial)!<11,
          selectedCompanyid != 0,
          selectedCategoryid != 0
    else{
              return
          }
    let currcate=AppDelegate.GlobalVariable.categorylist.testCategorylist.getCategory(id: selectedCategoryid)
    let currcomp = AppDelegate.GlobalVariable.companylist.testCompanylist.getCompany(id: selectedCompanyid)
    let Stock = Stock(name: name, lastTradePrice: Double(lastTrade)!, financialRating: Int(Fincial)!, category: currcate! , company: currcomp!)
    AppDelegate.GlobalVariable.stocklist.testStocklist.addStock(Stock: Stock)

    print(Stock.toString())
    let parentWin:UIView = sender.superview!;
    parentWin.removeFromSuperview()

    }
    

    //Table View
    func tableView(_ tableView: UITableView,numberOfRowsInSection section:Int)->Int{
        if (tableView == tableViewCompany){
            return AppDelegate.GlobalVariable.companylist.testCompanylist.getsize()
        }else{
        return (AppDelegate.GlobalVariable.categorylist.testCategorylist.getsize())
      }
    }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
       if (tableView == self.tableViewCompany){
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
        if (tableView == self.tableViewCompany){
            let selected = AppDelegate.GlobalVariable.companylist.testCompanylist.toString()[indexPath.row]
            selectedCompanyid=Int(selected.split(separator: " ")[0])!
            print(selectedCompanyid)
        }else{
            let selected = AppDelegate.GlobalVariable.categorylist.testCategorylist.toString()[indexPath.row]
            selectedCategoryid=Int(selected.split(separator: " ")[0])!
            print(selectedCategoryid)
        }
    
    }
    
    
    
    
@objc func closeWindow(sender : UIButton) {
    let nextview=ManagerStockUIView()
    self.addSubview(nextview)
    self.bringSubviewToFront(nextview)

}


}



