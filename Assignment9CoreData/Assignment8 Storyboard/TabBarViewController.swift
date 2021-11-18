//
//  TabBarViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/11/21.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let customer = Customer(firstName: "Yining", lastName: "Chen", address: "41MapleSt", contactDetails: "7326680885", emailID: "yinigchen2018gmail.com")
            let customer1 = Customer(firstName: "keqiang", lastName: "qu", address: "41MapleSt", contactDetails: "7326680885", emailID: "qu2018gmail.com")

            AppDelegate.GlobalVariable.customerlist.testcustomerlist.addCustomer(Customer: customer1)
            AppDelegate.GlobalVariable.customerlist.testcustomerlist.addCustomer(Customer: customer)
         
           let company = Company(name: "fb", symbol: "fb", headquarter: "ca", email: "fb.com")
            AppDelegate.GlobalVariable.companylist.testCompanylist.addCompany(Company: company)
        
          let company1 = Company(name: "Apple", symbol: "apple", headquarter: "ca", email: "apple.com")
           AppDelegate.GlobalVariable.companylist.testCompanylist.addCompany(Company: company1)
            
            let category = Category(name: "Tech")
            AppDelegate.GlobalVariable.categorylist.testCategorylist.addCategory(Category: category)
        let category1 = Category(name: "Online")
        AppDelegate.GlobalVariable.categorylist.testCategorylist.addCategory(Category: category1)
            let stock1 = Stock(name: "Fb", lastTradePrice: 100, financialRating: 9, category: category, company: company)
            let stock2 = Stock(name: "Apple", lastTradePrice: 10, financialRating: 8, category: category, company: company)
            let stock3 = Stock(name: "Amaz", lastTradePrice: 50, financialRating: 7, category: category, company: company)
            let stock4 = Stock(name: "Walmart", lastTradePrice: 1, financialRating: 6, category: category, company: company)
            AppDelegate.GlobalVariable.stocklist.testStocklist.addStock(Stock: stock1)
            AppDelegate.GlobalVariable.stocklist.testStocklist.addStock(Stock: stock2)
            AppDelegate.GlobalVariable.stocklist.testStocklist.addStock(Stock: stock3)
            AppDelegate.GlobalVariable.stocklist.testStocklist.addStock(Stock: stock4)
         // Do any additional setup after loading the view.
    
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
