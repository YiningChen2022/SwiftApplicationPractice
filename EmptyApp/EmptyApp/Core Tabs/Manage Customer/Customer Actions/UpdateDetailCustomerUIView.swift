//
//  UpdateDetailCustomerUIView.swift
//  EmptyApp
//
//  Created by Yining Chen on 10/31/21.
//  Copyright © 2021 rab. All rights reserved.
//

import Foundation
import UIKit
class UpdateDetailCustomerUIView :
    UIView {
    static var id = AppDelegate.GlobalVariable.selected
     static var currentCustomer=AppDelegate.GlobalVariable.customerlist.testcustomerlist.getCustomer(id: id)
    
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
     private let label: UILabel = {
         let label = UILabel()
         label.textAlignment = .center
         label.numberOfLines = 0
         label.font = .systemFont(ofSize: 15, weight: .medium)
         label.text = "if no change, leave it empty"
         label.frame = CGRect(x:60, y:50, width:200,height:30)
         return label
     }()


    //FN field
    private let fnField: UITextField = {
        let field=UITextField()
        field.leftView=UIView(frame: CGRect(x:0,y:0,width:10,height:50))
        field.leftViewMode = .always
        field.placeholder="First Name"
        field.backgroundColor = .white
        field.layer.cornerRadius=8
        field.layer.masksToBounds=true
        field.frame = CGRect(x:60, y:100, width:200,height:30)
        print(currentCustomer!.toString())
        
        return field
       
    }()
    
    
    //LN field
    private let lnField: UITextField = {
        let field=UITextField()
        field.leftView=UIView(frame: CGRect(x:0,y:0,width:10,height:50))
        field.frame = CGRect(x:60, y:150, width:200,height:30)
        field.leftViewMode = .always
        field.placeholder="Last Name "
        field.backgroundColor = .lightGray
        field.layer.cornerRadius=8
        field.layer.masksToBounds=true
        return field
    }()
    
    
    //Email Field
    private let emailField: UITextField = {
        let field=UITextField();
        field.keyboardType = .emailAddress
        field.leftView=UIView(frame: CGRect(x:0,y:0,width:10,height:50))
        field.leftViewMode = .always
        field.placeholder="Email Id "
        field.frame = CGRect(x:60, y:300, width:200,height:30)
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.backgroundColor = .lightGray
        field.layer.cornerRadius=8
        field.layer.masksToBounds=true
        return field
    }()
    //ContactDetail
    private let contactField: UITextField = {
        let field=UITextField();
        field.keyboardType = .emailAddress
        field.leftView=UIView(frame: CGRect(x:0,y:0,width:10,height:50))
        field.leftViewMode = .always
        field.placeholder="Contact Detail  "
        field.frame = CGRect(x:60, y:250, width:200,height:30)
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.backgroundColor =  .lightGray
        field.layer.cornerRadius=8
        field.layer.masksToBounds=true
        return field
    }()
    //address
    private let addressField: UITextField = {
        let field=UITextField();
        field.keyboardType = .emailAddress
        field.leftView=UIView(frame: CGRect(x:0,y:0,width:10,height:50))
        field.leftViewMode = .always
        field.placeholder="Address"
        field.frame = CGRect(x:60, y:200, width:200,height:30)
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.backgroundColor =  .lightGray
        field.layer.cornerRadius=8
        field.layer.masksToBounds=true
        return field
    }()
    //update button
    private let AddButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitle("Update customer", for: .normal )
        button.setTitleColor(.white, for: .normal)
        button.frame = CGRect(x:60, y:350, width:200,height:30)
        button.addTarget(self, action:#selector(didTapAddCustomer),for: .touchUpInside)
     
        return button
    }()

    override init (frame : CGRect) {
        super.init(frame :  CGRect(x:0, y: 0, width: 350, height: 600))
        backgroundColor = .systemGray
        self.backgroundColor = .systemGray
        self.addSubview(label)
        self.addSubview(emailField)
        self.addSubview(fnField)
        self.addSubview(lnField)
        self.addSubview(contactField)
        self.addSubview(addressField)
        self.addSubview(AddButton)
        addSubview(homeButton)
        
   
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func didTapAddCustomer(){
        guard let email=emailField.text,
              let firstName=fnField.text,
              let lastName=lnField.text,
              let contact=contactField.text,
              let address = addressField.text
        else{
                  return
              }
   
        AppDelegate.GlobalVariable.customerlist.testcustomerlist.UpdateCustomer(id: AppDelegate.GlobalVariable.selected, firstName: firstName, lastName: lastName, address: address, contactDetails: contact, emailId: email)
        print( AppDelegate.GlobalVariable.customerlist.testcustomerlist.getsize())

                    DispatchQueue.main.async {
                        let nextview=ManagerCustomerView()
                        self.addSubview(nextview)
                        self.bringSubviewToFront(nextview)
                    }
         
        }
    
    


}
