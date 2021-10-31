//
//  AddCategoryUIView.swift
//  EmptyApp
//
//  Created by Yining Chen on 10/31/21.
//  Copyright © 2021 rab. All rights reserved.
//

import Foundation
import UIKit

class AddCategoryUIView: UIView{
    
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
    private let nameField: UITextField = {
        let field=UITextField()
        field.leftView=UIView(frame: CGRect(x:0,y:0,width:10,height:50))
        field.leftViewMode = .always
        field.placeholder="Name"
        field.backgroundColor = .lightGray
        field.layer.cornerRadius=8
        field.layer.masksToBounds=true
        field.frame = CGRect(x:60, y:100, width:200,height:30)
        return field
    }()
    
    
    //sign in button
    private let AddButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitle("Add category", for: .normal )
        button.setTitleColor(.white, for: .normal)
        button.frame = CGRect(x:60, y:350, width:200,height:30)
        button.addTarget(self, action:#selector(didTapaddCategory),for: .touchUpInside)
        return button
    }()

    override init (frame : CGRect) {
        super.init(frame :  CGRect(x:0, y: 0, width: 350, height: 600))
        backgroundColor = .white
        
        addSubview(backButton)
        addSubview(AddButton)
        addSubview(nameField)
  
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
       
    

    
    @objc func didTapaddCategory(sender : UIButton){
        guard let name=nameField.text, !name.isEmpty

        else{
                  return
              }
        let category = Category(name: name)
        AppDelegate.GlobalVariable.categorylist.testCategorylist.addCategory(Category: category)
        let parentWin:UIView = sender.superview!;
        parentWin.removeFromSuperview()

        }
    @objc func closeWindow(sender : UIButton) {
        let nextview=ManagerCustomerView()
        self.addSubview(nextview)
        self.bringSubviewToFront(nextview)

   }


}

