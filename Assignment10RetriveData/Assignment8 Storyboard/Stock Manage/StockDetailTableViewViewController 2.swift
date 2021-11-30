//
//  StockDetailTableViewViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/15/21.
//

import UIKit

class StockDetailTableViewViewController: UIViewController {

    
    @IBOutlet weak var Category: UILabel!
    
    @IBOutlet weak var Name: UILabel!
    
    @IBOutlet weak var tradePrice: UILabel!
    
    @IBOutlet weak var Rating: UILabel!
    
    @IBOutlet weak var Company: UILabel!
    let id = AppDelegate.GlobalVariable.selectedStock
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentStock=AppDelegate.GlobalVariable.stocklist.testStocklist.getStock(id: id)
        Name.text=currentStock?.getName()
        tradePrice.text = currentStock?.getlastTradePrice().description
        Rating.text = currentStock?.getfinancialRating().description
        Company.text=currentStock?.getCompany().toStringshort()
        Category.text=currentStock?.getCategory().toString()
        

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
