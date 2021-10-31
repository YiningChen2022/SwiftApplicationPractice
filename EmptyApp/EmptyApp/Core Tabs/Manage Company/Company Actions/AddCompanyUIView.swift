//
//  AddCompanyViewController.swift
//  EmptyApp
//
//  Created by Yining Chen on 10/30/21.
//  Copyright © 2021 rab. All rights reserved.
//

import Foundation

import UIKit
class AddCompanyUIView: UIView {
    
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
    private let NameField: UITextField = {
        let field=UITextField()
        field.leftView=UIView(frame: CGRect(x:0,y:0,width:10,height:50))
        field.leftViewMode = .always
        field.placeholder="Name"
        field.backgroundColor = .lightGray
        field.layer.cornerRadius=8
        field.layer.masksToBounds=true
        field.frame = CGRect(x:60, y:150, width:200,height:30)
        return field
    }()
    
    
    //LN field
    private let SymbolField: UITextField = {
        let field=UITextField()
        field.leftView=UIView(frame: CGRect(x:0,y:0,width:10,height:50))
        field.leftViewMode = .always
        field.placeholder="Symbol"
        field.backgroundColor = .lightGray
        field.layer.cornerRadius=8
        field.layer.masksToBounds=true
        field.frame = CGRect(x:60, y:200, width:200,height:30)
        return field
    }()
    
    
    //Email Field
    private let HeadQuarterField: UITextField = {
        let field=UITextField();
        field.keyboardType = .emailAddress
        field.leftView=UIView(frame: CGRect(x:0,y:0,width:10,height:50))
        field.leftViewMode = .always
        field.placeholder="HeadQuarter "
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.backgroundColor = .lightGray
        field.layer.cornerRadius=8
        field.layer.masksToBounds=true
        field.frame = CGRect(x:60, y:300, width:200,height:30)
        return field
    }()
    //ContactDetail
    private let EmailField: UITextField = {
        let field=UITextField();
        field.keyboardType = .emailAddress
        field.leftView=UIView(frame: CGRect(x:0,y:0,width:10,height:50))
        field.leftViewMode = .always
        field.placeholder="Email "
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.backgroundColor =  .lightGray
        field.layer.cornerRadius=8
        field.layer.masksToBounds=true
        field.frame = CGRect(x:60, y:250, width:200,height:30)
        return field
    }()
   
    //sign in button
    private let AddButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitle("Add Company", for: .normal )
        button.setTitleColor(.white, for: .normal)
        button.frame = CGRect(x:60, y:350, width:200,height:30)
        button.addTarget(self, action:#selector(didTapAddCustomer),for: .touchUpInside)
        return button
    }()

    override init (frame : CGRect) {
        super.init(frame :  CGRect(x:0, y: 0, width: 350, height: 600))
        backgroundColor = .white
        addSubview(NameField)
        addSubview(SymbolField)
        addSubview(HeadQuarterField)
        addSubview(EmailField)
        addSubview(backButton)
        addSubview(AddButton)
  
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
       
    

    
    @objc func didTapAddCustomer(sender : UIButton){
        guard let name=NameField.text, !name.isEmpty,
              let symbol=SymbolField.text, !symbol.isEmpty,
              let headQuarter=HeadQuarterField.text, !headQuarter.isEmpty,
              let email=EmailField.text,!email.isEmpty
        else{
                  return
              }
        let company = Company(name: name, symbol: symbol, headquarter: headQuarter, email: email)
        AppDelegate.GlobalVariable.companylist.testCompanylist.addCompany(Company: company)
        
        let parentWin:UIView = sender.superview!;
        parentWin.removeFromSuperview()

        }
    @objc func closeWindow(sender : UIButton) {
        let nextview=ManagerCompanyView()
        self.addSubview(nextview)
        self.bringSubviewToFront(nextview)

   }


}


    
