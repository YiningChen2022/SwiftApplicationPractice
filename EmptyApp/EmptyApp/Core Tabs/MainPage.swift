//
//  MainPage.swift
//  EmptyApp
//
//  Created by Yining Chen on 10/31/21.
//  Copyright © 2021 rab. All rights reserved.
//

import Foundation
import UIKit

class MainPage:UIView {
    

//header
private let label: UILabel = {
    let label = UILabel()
    label.frame = CGRect(x:70,y:60,width: 200,height: 50)
    label.textAlignment = .center
    label.numberOfLines = 0
    label.font = .systemFont(ofSize: 20, weight: .medium)
    label.text = "Main Page"
    return label
}()


// manageCustomer
private let manageCustomerButton: UIButton = {
    let button = UIButton()
    button.setTitle("Manage Custmer", for: .normal )
    button.backgroundColor = .systemBlue
    button.setTitleColor(.white, for: .normal)
    button.frame = CGRect(x:70, y:120, width:200,height:50)
    button.addTarget(self, action:#selector(didTapCustomer),for: .touchUpInside)

   
    return button
}()

//manageCompany
private let manageCompanyButton: UIButton = {
    let button = UIButton()
    button.frame = CGRect(x:70, y:200, width:200,height:50)
    button.backgroundColor = .systemBlue
    button.setTitle("Manage Company", for: .normal )
    button.setTitleColor(.white, for: .normal)

    return button
}()

//manageStock
private let manageStockButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = .systemBlue
    button.setTitle("Manage Stock", for: .normal )
    button.setTitleColor(.white, for: .normal)
    button.frame = CGRect(x:70, y:360, width:200,height:50)
    return button
}()

//manageCategory
private let manageCategoryButton: UIButton = {
    let button = UIButton()
    button.frame = CGRect(x:70, y:280, width:200,height:50)
    button.backgroundColor = .systemBlue
    button.setTitle("Manage Category", for: .normal )
    button.setTitleColor(.white, for: .normal)
    button.addTarget(self, action:#selector(didTapCategory),for: .touchUpInside)

    return button
}()
    override init (frame : CGRect) {
        super.init(frame :  CGRect(x:0, y: 0, width: 350, height: 600))
        backgroundColor = .systemRed
        self.addSubview(manageCustomerButton)
        self.addSubview(label)
        self.addSubview(manageCompanyButton)
        self.addSubview(manageStockButton)
        self.addSubview(manageCategoryButton)
  
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

@objc func didTapCustomer(sender: UIButton){
    window?.addSubview(ManagerCustomerView())
    window?.bringSubviewToFront(ManagerCustomerView())

}

@objc func didTapCategory(sender: UIButton){
    window?.addSubview(ManagerCategoryUIView())
    window?.bringSubviewToFront(ManagerCustomerView())

}
}

