//
//  applicationViewController.swift
//  EmptyApp
//
//  Created by Yining Chen on 10/27/21.
//  Copyright © 2021 rab. All rights reserved.
//

import Foundation
import UIKit

class applicationViewController: UIViewController{

   
    //header
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.text = "Welcome!"
        return label
    }()
    
  
    // manageCustomer
    private let manageCustomerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Manage Custmer", for: .normal )
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    //manageCompany
    private let manageCompanyButton: UIButton = {
        let button = UIButton()
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
        return button
    }()
    
    //manageCategory
    private let manageCategoryButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Manage Category", for: .normal )
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.addSubview(manageCategoryButton)
        view.addSubview(manageStockButton)
        view.addSubview(manageCustomerButton)
        view.addSubview(manageCompanyButton)
        manageCustomerButton.addTarget(self, action:#selector(didTapCustomer),for: .touchUpInside)
        manageCompanyButton.addTarget(self, action:#selector(didTapComapny),for: .touchUpInside)
        manageStockButton.addTarget(self, action:#selector(didTapStock),for: .touchUpInside)
        manageCategoryButton.addTarget(self, action:#selector(didTapCategory),for: .touchUpInside)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        label.frame = CGRect(x:70,y:60,width: 200,height: 50)
        manageCustomerButton.frame = CGRect(x:70, y:120, width:200,height:50)
        manageCompanyButton.frame = CGRect(x:70, y:200, width:200,height:50)
        manageCategoryButton.frame = CGRect(x:70, y:280, width:200,height:50)
        manageStockButton.frame = CGRect(x:70, y:360, width:200,height:50)
        
    }

    @objc func didTapCustomer(){
       
        DispatchQueue.main.async {
            let vc = ManageCustomerViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated:false)
            
        }
    }
    @objc func didTapComapny(){
        DispatchQueue.main.async {
            let vc = ManageCompanyViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated:false)
        }
    }
    @objc func didTapCategory(){
    
    }
    @objc func didTapStock(){
       
    }
 




}
