//
//  ManageCategoryViewController.swift
//  EmptyApp
//
//  Created by Yining Chen on 11/2/21.
//  Copyright © 2021 rab. All rights reserved.
//

import UIKit

class ManageCategoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func closeWindow(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func didTapAddCate(_ sender: UIButton) {
        let vc = AddCategoryViewController()
           self.present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func didTapViewAll(_ sender: UIButton) {
        let vc = ViewAllCategoryViewController()
           self.present(vc, animated: true, completion: nil)
        
    }
    @IBAction func didTapUpdate(_ sender: UIButton) {
        let vc = UpdateCategoryViewController()
           self.present(vc, animated: true, completion: nil)
        
    }
    
    
    @IBAction func didTapDelete(_ sender: UIButton) {
        let vc = DeleteCategoryViewController()
           self.present(vc, animated: true, completion: nil)
        
    }
    
    
    
    
    
}
