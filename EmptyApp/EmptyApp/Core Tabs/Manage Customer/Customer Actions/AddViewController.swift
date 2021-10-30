//
//  AddViewController.swift
//  EmptyApp
//
//  Created by Yining Chen on 10/28/21.
//  Copyright © 2021 rab. All rights reserved.
//

import Foundation
import UIKit

class AddViewController: UITabBarController{
    //back button
    private let backButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("<Back", for: .normal )
        button.setTitleColor(.white, for: .normal)
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
        return field
    }()
    //sign in button
    private let AddButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitle("Add customer", for: .normal )
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "add Customer"
        view.backgroundColor = .white
        view.addSubview(backButton)
        view.addSubview(emailField)

        view.addSubview(fnField)
        view.addSubview(lnField)
        view.addSubview(contactField)
        view.addSubview(addressField)
        view.addSubview(AddButton)
      
        backButton.addTarget(self, action:#selector(didTapback),for: .touchUpInside)
        AddButton.addTarget(self, action:#selector(didTapAddCustomer),for: .touchUpInside)
     
    
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
       
    
        fnField.frame = CGRect(x:60, y:100, width:200,height:30)
        lnField.frame = CGRect(x:60, y:150, width:200,height:30)
        addressField.frame = CGRect(x:60, y:200, width:200,height:30)
        contactField.frame = CGRect(x:60, y:250, width:200,height:30)
        emailField.frame = CGRect(x:60, y:300, width:200,height:30)
        AddButton.frame = CGRect(x:60, y:350, width:200,height:30)
        backButton.frame=CGRect(x:60,y:400,width:100,height:25)
       
    }
    @objc func didTapAddCustomer(){
        guard let email=emailField.text, !email.isEmpty,
              let firstName=fnField.text, !firstName.isEmpty,
              let lastName=lnField.text, !lastName.isEmpty,
              let contact=contactField.text,!contact.isEmpty,
              let address = addressField.text,!address.isEmpty
        else{
                  return
              }
        let customer = Customer(firstName: firstName, lastName: lastName, address: address, contactDetails: contact, emailID: email)
        
        applicationViewController.GlobalVariable.customerlist.testcustomerlist.addCustomer(Customer: customer)
     

                    DispatchQueue.main.async {
                      
                        let vc = ManageCustomerViewController()
                        vc.modalPresentationStyle = .fullScreen
                        self.present(vc, animated:true)
                    }
         
        }


    @objc private func didTapback(){
     
        DispatchQueue.main.async {
         
            let signInVC=ManageCustomerViewController();
          
         
            signInVC.modalPresentationStyle = .fullScreen
            self.present( signInVC, animated: true, completion: nil)
        }
    }

}