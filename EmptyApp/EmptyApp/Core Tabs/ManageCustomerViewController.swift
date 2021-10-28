//
//  ManageCustomerViewController.swift
//  EmptyApp
//
//  Created by Yining Chen on 10/27/21.
//  Copyright © 2021 rab. All rights reserved.
//

import Foundation
import UIKit

class ManageCustomerViewController :UITabBarController  {
    
    
    //back button
    private let backButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("<Back", for: .normal )
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    //header
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.text = "Manage Customer"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.addSubview(backButton)
  
        backButton.addTarget(self, action:#selector(didTapback),for: .touchUpInside)
    }


    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        backButton.frame=CGRect(x:20,y:40,width:100,height:25)
        label.frame = CGRect(x:70,y:120,width: 200,height: 50)
        
     

    }
    @objc private func didTapback(){
        DispatchQueue.main.async {
         
            let signInVC=applicationViewController();

          
            let navVC = UINavigationController(rootViewController: signInVC)
          
            navVC.modalPresentationStyle = .fullScreen
            self.present(navVC, animated: true, completion: nil)
        }
    }
  

}
