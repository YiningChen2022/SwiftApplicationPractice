//
//  ManageStockUIView.swift
//  EmptyApp
//
//  Created by Yining Chen on 10/31/21.
//  Copyright © 2021 rab. All rights reserved.
//

import Foundation
import UIKit
class ManagerStockUIView: UIView{
    
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
       private let addStockButton: UIButton = {
           let button = UIButton()
           button.frame=CGRect(x: 70, y: 120, width: 200, height: 50)
           button.addTarget(self, action:#selector(didTapaddStock),for: .touchUpInside)
           button.backgroundColor = .systemBlue
           button.setTitle("Add Stock", for: .normal )
           button.setTitleColor(.white, for: .normal)
           return button
       }()
       // Delete customer
       private let deleteStockButton: UIButton = {
           let button = UIButton()
           button.frame=CGRect(x: 70, y: 280, width: 200, height: 50)
           button.backgroundColor = .systemBlue
           button.addTarget(self, action:#selector(didTapDeleteStock),for: .touchUpInside)
           button.setTitle("Delete Stock", for: .normal )
           button.setTitleColor(.white, for: .normal)
           return button
       }()
       
       // update customer
       private let updateStockButton: UIButton = {
           let button = UIButton()
           button.frame=CGRect(x: 70, y: 200, width: 200, height: 50)
           button.backgroundColor = .systemBlue
           button.addTarget(self, action:#selector(didTapUpdateStock),for: .touchUpInside)
           button.setTitle("Update Stock", for: .normal )
           button.setTitleColor(.white, for: .normal)
           return button
       }()
       // View all customer
       private let ViewStockButton: UIButton = {
           let button = UIButton()
           button.backgroundColor = .systemBlue
           button.setTitle("View all Stock", for: .normal )
           button.setTitleColor(.white, for: .normal)
           button.addTarget(self, action:#selector(didTapViewStock),for: .touchUpInside)
           button.frame=CGRect(x:70,y:360, width: 200, height: 50)
          
           return button
       }()
       override init (frame : CGRect) {
           super.init(frame :  CGRect(x:0, y: 0, width: 350, height: 600))
           backgroundColor = .white
           addSubview(backButton1)
           addSubview(updateStockButton)
           addSubview(ViewStockButton)
           addSubview(deleteStockButton)
           addSubview(addStockButton)
     
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
        
       @objc private func didTapaddStock (sender: UIButton){
           let nextview=AddStockUIView()
           self.addSubview(nextview)
           self.bringSubviewToFront(nextview)

       }
       @objc private func didTapUpdateStock (sender: UIButton){
           let nextview=UpdateStockUIView()
           self.addSubview(nextview)
           self.bringSubviewToFront(nextview)

       }
       @objc private func didTapDeleteStock (sender: UIButton){
           let nextview=DeleteStockUIView ()
           self.addSubview(nextview)
           self.bringSubviewToFront(nextview)

       }
       
       
       @objc private func didTapViewStock(sender: UIButton){
           let nextview=ViewStockUIView()
           self.addSubview(nextview)
           self.bringSubviewToFront(nextview)

       }
       
       @objc func closeWindow(sender : UIButton) {
           let nextview=MainPage()
           self.addSubview(nextview)
           self.bringSubviewToFront(nextview)

      }


   }

 
     
