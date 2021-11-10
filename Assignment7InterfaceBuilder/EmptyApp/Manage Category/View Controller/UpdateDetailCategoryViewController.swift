//
//  UpdateDetailCategoryViewController.swift
//  EmptyApp
//
//  Created by Yining Chen on 11/3/21.
//  Copyright © 2021 rab. All rights reserved.
//

import UIKit

class UpdateDetailCategoryViewController: UIViewController {

    @IBOutlet weak var NameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let id = AppDelegate.GlobalVariable.selectedCategory
        let currentCategory=AppDelegate.GlobalVariable.categorylist.testCategorylist.getCategory(id: id)
        NameField.text=currentCategory?.getName()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func namedid(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func CloseWindow(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    func Alert (){
        
        let alertController = UIAlertController(title:"Info",message:"Valid input", preferredStyle:  .alert)
        let OKAction = UIAlertAction(title: "OK", style:  .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController,animated:true,completion: nil)
    }


    @IBAction func didtapUpdate(_ sender: UIButton) {
        guard let name=NameField.text, !name.isEmpty
           
        else{
                  return Alert()
              }
        
        AppDelegate.GlobalVariable.categorylist.testCategorylist.UpdateCategory(id: AppDelegate.GlobalVariable.selectedCategory, name: name)
    
        dismiss(animated: true, completion: nil)
        
    }
    


}




