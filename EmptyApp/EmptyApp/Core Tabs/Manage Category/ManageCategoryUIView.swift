//
//  ManageCategoryUIView.swift
//  EmptyApp
//
//  Created by Yining Chen on 10/31/21.
//  Copyright © 2021 rab. All rights reserved.
//

import Foundation

import UIKit

class ManagerCategoryUIView: UIView{
 
     
 

    
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
    private let addCategoryButton: UIButton = {
        let button = UIButton()
        button.frame=CGRect(x: 70, y: 120, width: 200, height: 50)
        button.addTarget(self, action:#selector(didTapaddCategory),for: .touchUpInside)
        button.backgroundColor = .systemBlue
        button.setTitle("Add Category", for: .normal )
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    // Delete customer
    private let deleteCategoryButton: UIButton = {
        let button = UIButton()
        button.frame=CGRect(x: 70, y: 280, width: 200, height: 50)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action:#selector(didTapDeleteCategory),for: .touchUpInside)
        button.setTitle("Delete Category", for: .normal )
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    // update customer
    private let updateCategoryButton: UIButton = {
        let button = UIButton()
        button.frame=CGRect(x: 70, y: 200, width: 200, height: 50)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action:#selector(didTapUpdateCategory),for: .touchUpInside)
        button.setTitle("Update Category", for: .normal )
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    // View all customer
    private let ViewCategoryButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("View all Category", for: .normal )
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action:#selector(didTapViewCategory),for: .touchUpInside)
        button.frame=CGRect(x:70,y:360, width: 200, height: 50)
       
        return button
    }()
    override init (frame : CGRect) {
        super.init(frame :  CGRect(x:0, y: 0, width: 350, height: 600))
        backgroundColor = .systemRed
        addSubview(backButton1)
        addSubview(updateCategoryButton)
        addSubview(ViewCategoryButton)
        addSubview(deleteCategoryButton)
        addSubview(addCategoryButton)
  
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     
    @objc private func didTapaddCategory (sender: UIButton){
        let nextview=AddCustomerUIView()
        self.addSubview(nextview)
        self.bringSubviewToFront(nextview)

    }
    @objc private func didTapUpdateCategory (sender: UIButton){
        let nextview=UpdateCustomerUIView()
        self.addSubview(nextview)
        self.bringSubviewToFront(nextview)

    }
    @objc private func didTapDeleteCategory (sender: UIButton){
        let nextview=DeleteCustomerUIView()
        self.addSubview(nextview)
        self.bringSubviewToFront(nextview)

    }
    
    
    @objc private func didTapViewCategory (sender: UIButton){
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
