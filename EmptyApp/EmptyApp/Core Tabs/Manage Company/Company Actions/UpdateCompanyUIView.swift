//
//  UpdateCompanyUIView.swift
//  EmptyApp
//
//  Created by Yining Chen on 10/31/21.
//  Copyright © 2021 rab. All rights reserved.
//

import Foundation
import UIKit
class UpdateDetailCompanyUIView :
    UIView {
    static var id = AppDelegate.GlobalVariable.selectedCompany
    static var currentCompany=AppDelegate.GlobalVariable.companylist.testCompanylist.getCompany(id: id)
    
    
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
    private let NameField: UITextField = {
        let field=UITextField()
        field.leftView=UIView(frame: CGRect(x:0,y:0,width:10,height:50))
        field.leftViewMode = .always
        field.placeholder=AppDelegate.GlobalVariable.companylist.testCompanylist.getCompany(id: AppDelegate.GlobalVariable.selectedCompany)?.getName()
        field.backgroundColor = .lightGray
        field.layer.cornerRadius=8
        field.layer.masksToBounds=true
        field.frame = CGRect(x:60, y:150, width:200,height:30)
        field.isEnabled=false
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
    //update button
    private let AddButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitle("Update Company", for: .normal )
        button.setTitleColor(.white, for: .normal)
        button.frame = CGRect(x:60, y:350, width:200,height:30)
        button.addTarget(self, action:#selector(didTapAddCustomer),for: .touchUpInside)
     
        return button
    }()

    override init (frame : CGRect) {
        super.init(frame :  CGRect(x:0, y: 0, width: 350, height: 600))
       
        backgroundColor = .white
        addSubview(label)
        addSubview(NameField)
        addSubview(SymbolField)
        addSubview(HeadQuarterField)
        addSubview(EmailField)
        addSubview(AddButton)
        addSubview(homeButton)
 
        
   
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func didTapAddCustomer(){
        guard
              let symbol=SymbolField.text,
              let headQuarter=HeadQuarterField.text,
              let email=EmailField.text
        else{
                  return
              }
        
   
        AppDelegate.GlobalVariable.companylist.testCompanylist.UpdateCompany(id: AppDelegate.GlobalVariable.selectedCompany, symbol: symbol, headquarter: headQuarter, email: email)
            
       

                    DispatchQueue.main.async {
                        let nextview=ManagerCompanyView()
                        self.addSubview(nextview)
                        self.bringSubviewToFront(nextview)
                    }
         
        }
    
    


}
