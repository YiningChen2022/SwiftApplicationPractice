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
        button.frame=CGRect.init(x: 0.0, y:0.0, width:200.0, height:50.0)
        button.addTarget(self, action:#selector(closeWindow),for: .touchUpInside)
        button.backgroundColor = .systemBlue
        button.setTitle("<Back", for: .normal )
        button.setTitleColor(.white, for: .normal)
        button.isUserInteractionEnabled = true
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
        super.init(frame :  CGRect(x:0, y: 0, width: 350, height: 600))
        backgroundColor = .systemRed
        addSubview(backButton1)
        addSubview(updateCustomerButton)
        addSubview(ViewCustomerButton)
        addSubview(deleteCustomerButton)
        addSubview(addCustomerButton)
  
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     
    @objc private func didTapback(_ sender: UIButton){
        backButton1.removeFromSuperview()
        updateCustomerButton.removeFromSuperview()
        ViewCustomerButton.removeFromSuperview()
        deleteCustomerButton.removeFromSuperview()
        addCustomerButton.removeFromSuperview()
    }
    
    @objc func closeWindow(sender : UIButton) {
  let parentWin:UIView = sender.superview!;
  parentWin.removeFromSuperview()
   }


}
