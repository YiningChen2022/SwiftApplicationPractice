//
//  ManageCompanyViewController.swift
//  EmptyApp
//
//  Created by Yining Chen on 11/2/21.
//  Copyright © 2021 rab. All rights reserved.
//

import UIKit

class ManageCompanyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func closeWindow(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }


    @IBAction func didTapAddComp(_ sender: UIButton) {
        let vc = AddCompanyViewController()
           self.present(vc, animated: true, completion: nil)
        
    }
    
    
    @IBAction func didTapUpdateCom(_ sender: UIButton) {
        let vc = UpdateCompanyViewController()
           self.present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func didTapDeleteComp(_ sender: UIButton) {
        let vc = DeleteCompanyViewController()
           self.present(vc, animated: true, completion: nil)
        
    }
    
    
    @IBAction func didTapViewAll(_ sender: UIButton) {
        let vc = ViewAllCompanyViewController()
           self.present(vc, animated: true, completion: nil)
        
    }
    
}
