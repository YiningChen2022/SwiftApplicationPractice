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
    field.frame = CGRect(x:60, y:300, width:200,height:30)
    return field
}()

//sign in button
private let AddButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = .systemGreen
    button.setTitle("Add customer", for: .normal )
    button.setTitleColor(.white, for: .normal)
    button.frame = CGRect(x:60, y:350, width:200,height:30)
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

}

required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}

   



@objc func didTapAddCustomer(sender : UIButton){
    guard let email=emailField.text, !email.isEmpty,
          let firstName=fnField.text, !firstName.isEmpty,
          let lastName=lnField.text, !lastName.isEmpty,
          let contact=contactField.text,!contact.isEmpty,
          let address = addressField.text,!address.isEmpty
    else{
              return
          }
    let customer = Customer(firstName: firstName, lastName: lastName, address: address, contactDetails: contact, emailID: email)
    
    AppDelegate.GlobalVariable.customerlist.testcustomerlist.addCustomer(Customer: customer)
    print(customer.toString())
    let parentWin:UIView = sender.superview!;
    parentWin.removeFromSuperview()

    }
    

    //Table View
    func tableViewCompany(_ tableView: UITableView,numberOfRowsInSection section:Int)->Int{
        
        return (AppDelegate.GlobalVariable.categorylist.testCategorylist.getsize())
      }
   func tableViewCompany(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
      
          let cell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
       cell.textLabel?.text = AppDelegate.GlobalVariable.categorylist.testCategorylist.toString()[indexPath.row]
          return (cell)
      }
    func tableViewCompany(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let selected = AppDelegate.GlobalVariable.categorylist.testCategorylist.toString()[indexPath.row]
        selectedCategoryid=Int(selected.split(separator: " ")[0])!
      print("selected ")
     
    }
    
    
    
    
@objc func closeWindow(sender : UIButton) {
    let nextview=ManagerStockUIView()
    self.addSubview(nextview)
    self.bringSubviewToFront(nextview)

}


}



