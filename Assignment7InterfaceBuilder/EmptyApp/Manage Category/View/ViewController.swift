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
        let customer = Customer(firstName: "Yining", lastName: "Chen", address: "41 Maple St", contactDetails: "7326680885", emailID: "yinigchen2018gmail.com")
        let customer1 = Customer(firstName: "keqiang", lastName: "qu", address: "41 Maple St", contactDetails: "7326680885", emailID: "qu2018gmail.com")
        
        AppDelegate.GlobalVariable.customerlist.testcustomerlist.addCustomer(Customer: customer1)
        
        
        
        AppDelegate.GlobalVariable.customerlist.testcustomerlist.addCustomer(Customer: customer)
       let company = Company(name: "fb", symbol: "fb", headquarter: "ca", email: "fb.com")
        AppDelegate.GlobalVariable.companylist.testCompanylist.addCompany(Company: company)
        
        let category = Category(name: "Tech")
        AppDelegate.GlobalVariable.categorylist.testCategorylist.addCategory(Category: category)
        
        let stock1 = Stock(name: "Fb", lastTradePrice: 100, financialRating: 9, category: category, company: company)
        let stock2 = Stock(name: "Apple", lastTradePrice: 10, financialRating: 8, category: category, company: company)
        let stock3 = Stock(name: "Amaz", lastTradePrice: 50, financialRating: 7, category: category, company: company)
        let stock4 = Stock(name: "Walmart", lastTradePrice: 1, financialRating: 6, category: category, company: company)
        AppDelegate.GlobalVariable.stocklist.testStocklist.addStock(Stock: stock1)
        AppDelegate.GlobalVariable.stocklist.testStocklist.addStock(Stock: stock2)
        AppDelegate.GlobalVariable.stocklist.testStocklist.addStock(Stock: stock3)
        AppDelegate.GlobalVariable.stocklist.testStocklist.addStock(Stock: stock4)
        
        
        
    
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
            //welcomeLabel.text="change"
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func OpenButtonPressed(_ sender: UIButton) {
        
        
       /* let alertController = UIAlertController(title:"Info",message:"button clicked", preferredStyle:  .alert)
        let OKAction = UIAlertAction(title: "OK", style:  .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController,animated:true,completion: nil)
        */
        let vc = ViewCustomerViewController()
           self.present(vc, animated: true, completion: nil)
        
   
    }
    
    @IBAction func didTapCompany(_ sender: UIBarButtonItem) {
        let vc = ManageCompanyViewController()
           self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func didTapCustomer(_ sender: UIBarButtonItem) {
     let vc = ManageCustomerViewController()
        self.present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func didTapView(_ sender: UIButton) {
        let vc = ViewAllOrdersViewController()
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
    
    
    

}
