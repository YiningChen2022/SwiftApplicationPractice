//
//  test.swift
//  EmptyApp
//
//  Created by Yining Chen on 10/30/21.
//  Copyright © 2021 rab. All rights reserved.
//

import Foundation

import UIKit

class test: UIView{
     
    struct GlobalVariable{
        public static var customerlist=CustomerManager()
        public static var selected=0
     }
   

    
    //header
    private let label: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x:70,y:60,width: 200,height: 50)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.text = "Welcome!"
        return label
    }()
    
  
    // manageCustomer
    private let manageCustomerButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x:70, y:120, width:200,height:50)
        button.backgroundColor = .systemBlue
        button.setTitle("Manage Custmer", for: .normal )
        button.setTitleColor(.white, for: .normal)
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
        button.addTarget(self, action:#selector(didTapComapny),for: .touchUpInside)
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
        return button
    }()
    
    override init (frame : CGRect) {
        super.init(frame : frame)
        self.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1.0)
        self.addSubview(label)
        self.addSubview(manageCategoryButton)
        self.addSubview(manageStockButton)
        self.addSubview(manageCustomerButton)
        self.addSubview(manageCompanyButton)
       /*  manageCustomerButton.addTarget(self, action:#selector(didTapCustomer),for: .touchUpInside)
         manageCompanyButton.addTarget(self, action:#selector(didTapComapny),for: .touchUpInside)
         manageStockButton.addTarget(self, action:#selector(didTapStock),for: .touchUpInside)
         manageCategoryButton.addTarget(self, action:#selector(didTapCategory),for: .touchUpInside)
      */
         
    }
    func updateData(title:String){
        //self.label.text = title
    }
     
     
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /* override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        label.frame = CGRect(x:70,y:60,width: 200,height: 50)
        manageCustomerButton.frame = CGRect(x:70, y:120, width:200,height:50)
        manageCompanyButton.frame = CGRect(x:70, y:200, width:200,height:50)
        manageCategoryButton.frame = CGRect(x:70, y:280, width:200,height:50)
        manageStockButton.frame = CGRect(x:70, y:360, width:200,height:50)
        
    }*/

    @objc func didTapCustomer(){
      
        let newView = UIView()
        self.addSubview(newView)
        newView.backgroundColor = UIColor.blue
        newView.frame = CGRect(x: 10, y: 50, width: 200, height: 250)

    }
    @objc func didTapComapny(){
        
        DispatchQueue.main.async {
            self.addSubview(test2())
        }
        
    }
    @objc func didTapCategory(){
        /*DispatchQueue.main.async {
            let vc = ManageategoryViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated:false)
            
        }*/
    }
    @objc func didTapStock(){
       /* DispatchQueue.main.async {
            let vc = ManageStockViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated:false)
            
        }*/
    }
 




}
