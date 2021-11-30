//
//  OrderViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/16/21.
//

import UIKit

class OrderViewController: UIViewController {

    @IBOutlet weak var invest: UILabel!
    @IBOutlet weak var earning: UILabel!
    @IBOutlet weak var Customerfn: UILabel!
    let customer = AppDelegate.GlobalVariable.customerlist.testcustomerlist.getCustomer(id: AppDelegate.GlobalVariable.selectedOrderid)
    override func viewDidLoad() {
        super.viewDidLoad()
       
        Customerfn.text=customer?.getFirstName()
        earning.text="\(customer!.getTotalEarning())"
        invest.text="\(customer!.getTotalInvestment())"
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
