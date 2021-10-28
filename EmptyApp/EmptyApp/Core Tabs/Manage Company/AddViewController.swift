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
    
    //FN field
    private let fnField: UITextField = {
        let field=UITextField()
        field.leftView=UIView(frame: CGRect(x:0,y:0,width:10,height:50))
        field.leftViewMode = .always
        field.placeholder="First Name"
        field.backgroundColor = .gray
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
        field.backgroundColor = .gray
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
        field.backgroundColor = .gray
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
        field.backgroundColor = .gray
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
        field.backgroundColor = .gray
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
    
        view.addSubview(emailField)
            view.addSubview(fnField)
            view.addSubview(lnField)
            view.addSubview(contactField)
            view.addSubview(addressField)
            view.addSubview(AddButton)

        
        AddButton.addTarget(self, action:#selector(didTapSignUp),for: .touchUpInside)
     
    
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
   
        fnField.frame = CGRect(x:20, y:50, width:100,height:50)
        lnField.frame = CGRect(x:20, y:60, width:100,height:50)
        contactField.frame = CGRect(x:20, y:70, width:100,height:50)
        addressField.frame = CGRect(x:20, y:800, width:100,height:50)
       
    }
    @objc func didTapSignUp(){
       /* guard let email=emailField.text, !email.isEmpty,
              let password=passwordField.text, !password.isEmpty,
              let name=nameField.text, !name.isEmpty else{
                  return
              }
    
    */
    
}

}
