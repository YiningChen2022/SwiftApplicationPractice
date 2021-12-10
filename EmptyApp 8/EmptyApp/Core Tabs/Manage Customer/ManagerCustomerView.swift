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
    private let backButton1: UIButton = {
        let button = UIButton()
        button.frame=CGRect.init(x:20,y:40,width:100,height:25)
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
        button.addTarget(self, action:#selector(didTapaddCustomer),for: .touchUpInside)
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
        button.addTarget(self, action:#selector(didTapDeleteCustomer),for: .touchUpInside)
        button.setTitle("Delete Customer", for: .normal )
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    // update customer
    private let updateCustomerButton: UIButton = {
        let button = UIButton()
        button.frame=CGRect(x: 70, y: 200, width: 200, height: 50)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action:#selector(didTapUpdateCustomer),for: .touchUpInside)
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
        button.addTarget(self, action:#selector(didTapViewCustomer),for: .touchUpInside)
        button.frame=CGRect(x:70,y:360, width: 200, height: 50)
       
        return button
    }()
    override init (frame : CGRect) {
        super.init(frame :  CGRect(x:0, y: 0, width: 350, height: 600))
        backgroundColor = .white
        addSubview(backButton1)
        addSubview(updateCustomerButton)
        addSubview(ViewCustomerButton)
        addSubview(deleteCustomerButton)
        addSubview(addCustomerButton)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     
    @objc private func didTapaddCustomer (sender: UIButton){
        let nextview=AddCustomerUIView()
        self.addSubview(nextview)
        self.bringSubviewToFront(nextview)

    }
    @objc private func didTapUpdateCustomer (sender: UIButton){
        let nextview=UpdateCustomerUIView()
        self.addSubview(nextview)
        self.bringSubviewToFront(nextview)

    }
    @objc private func didTapDeleteCustomer (sender: UIButton){
        let nextview=DeleteCustomerUIView()
        self.addSubview(nextview)
        self.bringSubviewToFront(nextview)

    }
    
    
    @objc private func didTapViewCustomer (sender: UIButton){
        let nextview=ViewCustomerUIView()
        self.addSubview(nextview)
        self.bringSubviewToFront(nextview)

    }
    
    @objc func closeWindow(sender : UIButton) {
        let nextview=MainPage()
        self.addSubview(nextview)
        self.bringSubviewToFront(nextview)

   }


}
