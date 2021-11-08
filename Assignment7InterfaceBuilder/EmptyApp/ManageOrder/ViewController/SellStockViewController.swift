//
//  SellStockViewController.swift
//  EmptyApp
//
//  Created by Yining Chen on 11/8/21.
//  Copyright © 2021 rab. All rights reserved.
//

import UIKit

class SellStockViewController: UIViewController {
    var selectstock=AppDelegate.GlobalVariable.stocklist.testStocklist.getStock(id: AppDelegate.GlobalVariable.sellStockid)
    let customer = AppDelegate.GlobalVariable.customerlist.testcustomerlist.getCustomer(id: AppDelegate.GlobalVariable.selectedOrderid)
    @IBOutlet weak var stockfield: UILabel!

    @IBOutlet weak var AvgCost: UILabel!
    @IBOutlet weak var quantity: UILabel!
    override func viewDidLoad() {
        stockfield.text=selectstock?.getName()
        quantity.text=String(AppDelegate.GlobalVariable.orderlist.testOrderlist.totalStockQuantityforCustomer(customer: customer!, stock: selectstock!)
                        )
        AvgCost.text=String(AppDelegate.GlobalVariable.orderlist.testOrderlist.avgforCustomer(customer: customer!, stock: selectstock!))
        super.viewDidLoad()
        
    }
    


}
