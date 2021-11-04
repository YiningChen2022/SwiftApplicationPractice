//
//  UpdateDetailStockViewController.swift
//  EmptyApp
//
//  Created by Yining Chen on 11/3/21.
//  Copyright © 2021 rab. All rights reserved.
//

import UIKit

class UpdateDetailStockViewController: UIViewController{
//UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var lasttradefield: UITextField!
    
    
    @IBOutlet weak var Ratingfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func didName(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func closewindow(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
