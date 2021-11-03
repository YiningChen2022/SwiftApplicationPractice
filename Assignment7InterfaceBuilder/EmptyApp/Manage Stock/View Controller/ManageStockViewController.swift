//
//  ManageStockViewController.swift
//  EmptyApp
//
//  Created by Yining Chen on 11/2/21.
//  Copyright © 2021 rab. All rights reserved.
//

import UIKit

class ManageStockViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func CloseWindow(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didtapView(_ sender: UIButton) {
        let vc = ViewAllStockViewController()
           self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func didtapadd(_ sender: UIButton) {
        let vc = AddStockViewController()
           self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func didtapdelete(_ sender: UIButton) {
        let vc = DeleteStockViewController()
           self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func didtapUpdate(_ sender: UIButton) {
        let vc = UpdateStockViewController()
           self.present(vc, animated: true, completion: nil)
    }
    
    

}
