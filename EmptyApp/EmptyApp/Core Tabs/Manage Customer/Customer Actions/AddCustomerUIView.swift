//
//  AddCustomerUIView.swift
//  EmptyApp
//
//  Created by Yining Chen on 10/30/21.
//  Copyright © 2021 rab. All rights reserved.
//

import Foundation
import UIKit
class AddCustomerUIView: UIView {
    
    //back button
    private let backButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("<Back", for: .normal )
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action:#selector(closeWindow),for: .touchUpInside)
        button.frame=CGRect(x:60,y:400,width:100,height:25)
        return button
    }()

    
    //FN field
    private let fnField: UITextField = {
        let field=UITextField()
        field.leftView=UIView(frame: CGRect(x:0,y:0,width:10,height:50))
        field.leftViewMode = .always
        field.placeholder="First Name"
        field.backgroundColor = .lightGray
        field.layer.cornerRadius=8
        field.layer.masksToBounds=true
        field.frame = CGRect(x:60, y:100, width:200,height:30)
        return field
    }()
    
    
    //LN field
    private let lnField: UITextField = {
        let field=UITextField()
        field.leftView=UIView(frame: CGRect(x:0,y:0,width:10,height:50))
        field.leftViewMode = .always
        field.placeholder="last Name"
        field.backgroundColor = .lightGray
        field.layer.cornerRadius=8
        field.layer.masksToBounds=true
        field.frame = CGRect(x:60, y:150, width:200,height:30)
        return field
    }()
    
    
    //Email Field
    private let emailField: UITextField = {
        let field=UITextField();
        field.keyboardType = .emailAddress
        field.leftView=UIView(frame: CGRect(x:0,y:0,width:10,height:50))
        field.leftViewMode = .always
        field.placeholder="Email Id "
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.backgroundColor = .lightGray
        field.layer.cornerRadius=8
        field.layer.masksToBounds=true
        field.frame = CGRect(x:60, y:300, width:200,height:30)
        return field
    }()
    //ContactDetail
    private let contactField: UITextField = {
        let field=UITextField();
        field.keyboardType = .emailAddress
        field.leftView=UIView(frame: CGRect(x:0,y:0,width:10,height:50))
        field.leftViewMode = .always
        field.placeholder="Contact Detail  "
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.backgroundColor =  .lightGray
        field.layer.cornerRadius=8
        field.layer.masksToBounds=true
        field.frame = CGRect(x:60, y:250, width:200,height:30)
        return field
    }()
    //address
    private let addressField: UITextField = {
        let field=UITextField();
        field.keyboardType = .emailAddress
        field.leftView=UIView(frame: CGRect(x:0,y:0,width:10,height:50))
        field.leftViewMode = .always
        field.placeholder="Address"
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.backgroundColor =  .lightGray
        field.layer.cornerRadius=8
        field.layer.masksToBounds=true
        field.frame = CGRect(x:60, y:200, width:200,height:30)
        return field
    }()
    //sign in button
    private let AddButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitle("Add customer", for: .normal )
        button.setTitleColor(.white, for: .normal)
        button.frame = CGRect(x:60, y:350, width:200,height:30)
        button.addTarget(self, action:#selector(didTapAddCustomer),for: .touchUpInside)
        return button
    }()

    override init (frame : CGRect) {
        super.init(frame :  CGRect(x:0, y: 0, width: 350, height: 600))
        backgroundColor = .systemGray
        addSubview(fnField)
        addSubview(lnField)
        addSubview(emailField)
        addSubview(contactField)
        addSubview(addressField)
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
    @objc func closeWindow(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        parentWin.removeFromSuperview()
   }


}


    
