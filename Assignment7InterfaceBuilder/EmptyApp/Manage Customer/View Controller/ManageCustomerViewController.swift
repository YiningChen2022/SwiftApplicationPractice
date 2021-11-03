//
//  ManageCustomerViewController.swift
//  EmptyApp
//
//  Created by Yining Chen on 11/2/21.
//  Copyright © 2021 rab. All rights reserved.
//

import UIKit

class ManageCustomerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func CloseWindow(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
 
    
    
    @IBAction func DidTapAddCustomer(_ sender: UIButton) {
        let vc = AddCustomerViewController()
           self.present(vc, animated: true, completion: nil)
        
    }
    
    
    @IBAction func DidTapUpdateCustomer(_ sender: UIButton) {
    }
    
    
    @IBAction func DIdTapDeleteCustomer(_ sender: UIButton) {
    }
    
    @IBAction func DidTapViewAllCustomer(_ sender: UIButton) {
    }
    
}
