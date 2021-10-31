//
//  UpdateDetailCategoryUIView.swift
//  EmptyApp
//
//  Created by Yining Chen on 10/31/21.
//  Copyright © 2021 rab. All rights reserved.
//

import Foundation
import UIKit


class UpdateDetailCategoryUIView :UIView{
    
    static var id = AppDelegate.GlobalVariable.selectedCategory
    static var currentCustomer=AppDelegate.GlobalVariable.categorylist.testCategorylist.getCategory(id: id)
    
    
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
        field.placeholder="Name"
        field.backgroundColor = .lightGray
        field.layer.cornerRadius=8
        field.layer.masksToBounds=true
        field.frame = CGRect(x:60, y:100, width:200,height:30)
        print(currentCustomer!.toString())
        
        return field
       
    }()
    
    

    //update button
    private let AddButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitle("Update Category", for: .normal )
        button.setTitleColor(.white, for: .normal)
        button.frame = CGRect(x:60, y:350, width:200,height:30)
        button.addTarget(self, action:#selector(didTapAddCustomer),for: .touchUpInside)
     
        return button
    }()

    override init (frame : CGRect) {
        super.init(frame :  CGRect(x:0, y: 0, width: 350, height: 600))
        backgroundColor = .systemGray
        self.backgroundColor = .systemGray
        self.addSubview(label)
        self.addSubview(NameField)
        self.addSubview(AddButton)
        
   
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func didTapAddCustomer(){
        guard let name=NameField.text
           
        else{
                  return
              }
        
        AppDelegate.GlobalVariable.categorylist.testCategorylist.UpdateCategory(id: AppDelegate.GlobalVariable.selectedCategory, name: name)
    

                    DispatchQueue.main.async {
                        let nextview=ManagerCategoryUIView()
                        self.addSubview(nextview)
                        self.bringSubviewToFront(nextview)
                    }
         
        }
    
    


}
