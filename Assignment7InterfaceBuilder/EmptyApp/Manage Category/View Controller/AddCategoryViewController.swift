//
//  AddCategoryViewController.swift
//  EmptyApp
//
//  Created by Yining Chen on 11/3/21.
//  Copyright © 2021 rab. All rights reserved.
//

import UIKit

class AddCategoryViewController: UIViewController {

    @IBOutlet weak var NameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didName(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func CloseWindow(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

    @IBAction func didTapAddCategory(_ sender: UIButton) {
        guard let name=NameField.text, !name.isEmpty

        else{
                  return 
              }
        let category = Category(name: name)
        AppDelegate.GlobalVariable.categorylist.testCategorylist.addCategory(Category: category)
        dismiss(animated: true, completion: nil)

        
    }
    func Alert (){
        
        let alertController = UIAlertController(title:"Info",message:"Valid input", preferredStyle:  .alert)
        let OKAction = UIAlertAction(title: "OK", style:  .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController,animated:true,completion: nil)
    }
    
}
