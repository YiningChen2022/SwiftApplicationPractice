//
//  ManageCompanyUIView.swift
//  EmptyApp
//
//  Created by Yining Chen on 10/31/21.
//  Copyright © 2021 rab. All rights reserved.
//

import Foundation
import UIKit

class ManagerCompanyView: UIView{
 
    
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
    private let addCompanyButton: UIButton = {
        let button = UIButton()
        button.frame=CGRect(x: 70, y: 120, width: 200, height: 50)
        button.addTarget(self, action:#selector(didTapaddCompany),for: .touchUpInside)
        button.backgroundColor = .systemBlue
        button.setTitle("Add Company", for: .normal )
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    // Delete customer
    private let deleteCompanyButton: UIButton = {
        let button = UIButton()
        button.frame=CGRect(x: 70, y: 280, width: 200, height: 50)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action:#selector(didTapDeleteCompany),for: .touchUpInside)
        button.setTitle("Delete Company", for: .normal )
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    // update customer
    private let updateCompanyButton: UIButton = {
        let button = UIButton()
        button.frame=CGRect(x: 70, y: 200, width: 200, height: 50)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action:#selector(didTapUpdateCompany),for: .touchUpInside)
        button.setTitle("Update Company", for: .normal )
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    // View all customer
    private let ViewCompanyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("View all Company", for: .normal )
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action:#selector(didTapViewCompany),for: .touchUpInside)
        button.frame=CGRect(x:70,y:360, width: 200, height: 50)
       
        return button
    }()
    override init (frame : CGRect) {
        super.init(frame :  CGRect(x:0, y: 0, width: 350, height: 600))
        backgroundColor = .systemRed
        addSubview(backButton1)
        addSubview(updateCompanyButton)
        addSubview(ViewCompanyButton)
        addSubview(deleteCompanyButton)
        addSubview(addCompanyButton)
  
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     
    @objc private func didTapaddCompany (sender: UIButton){
        let nextview=AddCompanyUIView()
        self.addSubview(nextview)
        self.bringSubviewToFront(nextview)

    }
    @objc private func didTapUpdateCompany (sender: UIButton){
        let nextview=UpdateCompanyUIView()
        self.addSubview(nextview)
        self.bringSubviewToFront(nextview)

    }
    @objc private func didTapDeleteCompany (sender: UIButton){
        let nextview=DeleteCompanyUIView()
        self.addSubview(nextview)
        self.bringSubviewToFront(nextview)

    }
    
    
    @objc private func didTapViewCompany (sender: UIButton){
        let nextview=ViewCompanyUIView()
        self.addSubview(nextview)
        self.bringSubviewToFront(nextview)

    }
    
    @objc func closeWindow(sender : UIButton) {
        let nextview=MainPage()
        self.addSubview(nextview)
        self.bringSubviewToFront(nextview)

   }


}
