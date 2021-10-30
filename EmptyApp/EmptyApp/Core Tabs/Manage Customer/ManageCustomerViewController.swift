//
//  ManageCustomerViewController.swift
//  EmptyApp
//
//  Created by Yining Chen on 10/27/21.
//  Copyright © 2021 rab. All rights reserved.
//

import Foundation
import UIKit

class ManageCustomerViewController : UIViewController{


    override func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
    }
    //back button
    private let backButton1: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("<Back", for: .normal )
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    
    // add customer
    private let addCustomerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Add Customer", for: .normal )
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    // Delete customer
    private let deleteCustomerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("deleteCustomer", for: .normal )
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    // update customer
    private let updateCustomerButton: UIButton = {
        let button = UIButton()
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
        return button
    }()
    


    
    

    
     override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(backButton1)
        view.addSubview(addCustomerButton)
        view.addSubview(updateCustomerButton)
        view.addSubview(deleteCustomerButton)
        view.addSubview(ViewCustomerButton)
  
         
         backButton1.frame=CGRect(x:20,y:40,width:100,height:25)
         addCustomerButton.frame=CGRect(x: 70, y: 120, width: 200, height: 50)
         updateCustomerButton.frame=CGRect(x: 70, y: 200, width: 200, height: 50)
         deleteCustomerButton.frame=CGRect(x: 70, y: 280, width: 200, height: 50)
         ViewCustomerButton.frame=CGRect(x:70,y:360, width: 200, height: 50)

     
  
       // backButton1.addTarget(self, action:#selector(didTapback1),for: .touchUpInside)
     /*   addCustomerButton.addTarget(self, action:#selector(didTapadd),for: .touchUpInside)
        updateCustomerButton.addTarget(self, action:#selector(didTapUpdate),for: .touchUpInside)
        deleteCustomerButton.addTarget(self, action:#selector(didTapDelete),for: .touchUpInside)
         ViewCustomerButton.addTarget(self, action:#selector(didTapView),for: .touchUpInside)
    }*/
  

 

   /* override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @objc private func didTapback1(){
        /*DispatchQueue.main.async {
         
            let signInVC=applicationViewController();

          
            let navVC = UINavigationController(rootViewController: signInVC)
          
            navVC.modalPresentationStyle = .fullScreen
            self.present(navVC, animated: false, completion: nil)*/
        }
    }
    
    @objc private func didTapadd(){
        DispatchQueue.main.async {
         
            let addVC=AddViewController();
            let navVC = UINavigationController(rootViewController: addVC)
          
            navVC.modalPresentationStyle = .fullScreen
            self.present(navVC, animated: false, completion: nil)
        }
    }
    @objc private func didTapUpdate(){
        DispatchQueue.main.async {
         
            let signInVC=UpdateCustomerViewController();

          
            let navVC = UINavigationController(rootViewController: signInVC)
          
            navVC.modalPresentationStyle = .fullScreen
            self.present(navVC, animated: false, completion: nil)
        }
    }
    @objc private func didTapDelete(){
        DispatchQueue.main.async {
            let signInVC=DeleteCustomerViewController();
            let navVC = UINavigationController(rootViewController: signInVC)
            navVC.modalPresentationStyle = .fullScreen
            self.present(navVC, animated: false, completion: nil)
        }
    }
    @objc private func didTapView(){
        DispatchQueue.main.async {
         
            let signInVC=ViewAllCustomerViewController();

          
            let navVC = UINavigationController(rootViewController: signInVC)
          
            navVC.modalPresentationStyle = .fullScreen
            self.present(navVC, animated: false, completion: nil)
        }
    }
}
    */
}
}
