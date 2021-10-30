//
//  test.swift
//  EmptyApp
//
//  Created by Yining Chen on 10/30/21.
//  Copyright © 2021 rab. All rights reserved.
//

import Foundation

import UIKit

class ManagerCustomerView: UIView{
 

    struct GlobalVariable{
        public static var customerlist=CustomerManager()
        public static var selected=0
     }
   

    
    //back button
    private let backButton1: UIButton = {
        let button = UIButton()
        button.frame=CGRect(x:20,y:40,width:100,height:25)
        button.backgroundColor = .systemBlue
        button.setTitle("<Back", for: .normal )
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    
    // add customer
    private let addCustomerButton: UIButton = {
        let button = UIButton()
        button.frame=CGRect(x: 70, y: 120, width: 200, height: 50)
        button.backgroundColor = .systemBlue
        button.setTitle("Add Customer", for: .normal )
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    // Delete customer
    private let deleteCustomerButton: UIButton = {
        let button = UIButton()
        button.frame=CGRect(x: 70, y: 280, width: 200, height: 50)
        button.backgroundColor = .systemBlue
        button.setTitle("deleteCustomer", for: .normal )
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    // update customer
    private let updateCustomerButton: UIButton = {
        let button = UIButton()
        button.frame=CGRect(x: 70, y: 200, width: 200, height: 50)
        button.backgroundColor = .systemBlue
        button.setTitle("Update Customer", for: .normal )
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    // View all customer
    private let ViewCustomerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("View all Customer", for: .normal )
        button.setTitleColor(.white, for: .normal)
        button.frame=CGRect(x:70,y:360, width: 200, height: 50)
        return button
    }()
    override init (frame : CGRect) {
        super.init(frame : frame)
        //self.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1.0)
        /*AppDelegate.GlobalVariable.window?.addSubview(label)
        AppDelegate.GlobalVariable.window?.addSubview(manageCategoryButton)
        AppDelegate.GlobalVariable.window?.addSubview(manageStockButton)
        AppDelegate.GlobalVariable.window?.addSubview(manageCustomerButton)
        AppDelegate.GlobalVariable.window?.addSubview(manageCompanyButton)
   */
        self.addSubview(backButton1)
        self.addSubview(updateCustomerButton)
        self.addSubview(ViewCustomerButton)
        self.addSubview(deleteCustomerButton)
        self.addSubview(addCustomerButton)
         
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     
    
    
 



}
