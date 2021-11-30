//
//  OrderViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/16/21.
//

import UIKit
import CoreData
class OrderViewController: UIViewController {
    var context: NSManagedObjectContext=(UIApplication.shared.delegate as! AppDelegate).managedObjectContext!
    let currCustomer = ViewCustomerTableViewController.choosedCustomer
    
    @IBOutlet weak var invest: UILabel!
    @IBOutlet weak var earning: UILabel!
    @IBOutlet weak var Customerfn: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        Customerfn.text=currCustomer!.firstName
        
        earning.text=currCustomer!.totalEarning.description
       
        invest.text=currCustomer!.totalInvestment.description
       
        // Do any additional setup after loading the view.
    }
    

  

}
