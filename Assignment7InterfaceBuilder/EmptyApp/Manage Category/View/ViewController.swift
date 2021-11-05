//
//  ViewController.swift
//  EmptyApp
//
//  Created by Yining Chen on 11/2/21.
//  Copyright © 2021 rab. All rights reserved.
//

import Foundation
import UIKit


class ViewController: UIViewController{
    @IBOutlet weak var welcomeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        welcomeLabel.text="change"
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func OpenButtonPressed(_ sender: UIButton) {
        
        
        let alertController = UIAlertController(title:"Info",message:"button clicked", preferredStyle:  .alert)
        let OKAction = UIAlertAction(title: "OK", style:  .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController,animated:true,completion: nil)
        
   
    }
    
    @IBAction func didTapCompany(_ sender: UIBarButtonItem) {
        let vc = ManageCompanyViewController()
           self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func didTapCustomer(_ sender: UIBarButtonItem) {
     let vc = ManageCustomerViewController()
        self.present(vc, animated: true, completion: nil)
        
    }
    
    
    @IBAction func didTapCategory(_ sender: UIBarButtonItem) {
        let vc = ManageCategoryViewController()
           self.present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func didTapStock(_ sender: UIBarButtonItem) {
        let vc = ManageStockViewController()
           self.present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func didTapCreateOrder(_ sender: UIButton) {
        
        
    }
    
    
}
