//
//  OrderViewController.swift
//  EmptyApp
//
//  Created by Yining Chen on 11/5/21.
//  Copyright © 2021 rab. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {

    @IBOutlet weak var Customerfn: UILabel!
    let customer = AppDelegate.GlobalVariable.customerlist.testcustomerlist.getCustomer(id: AppDelegate.GlobalVariable.selectedOrderid)
    override func viewDidLoad() {
        super.viewDidLoad()
        Customerfn.text=customer?.getFirstName()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func closeWindow(_ sender: UIButton) {
        
        
        
    }
    
    
    
    
    
    

}
