//
//  UpdateCategoryViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/12/21.
//

import UIKit

class UpdateCategoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let id = AppDelegate.GlobalVariable.selectedCategory
        if (id==0){
            Alert1()
        }else{
            let currentCategory=AppDelegate.GlobalVariable.categorylist.testCategorylist.getCategory(id: id)
            NameField.text=currentCategory?.getName()

        }
       
    }
    
  
    @IBOutlet weak var NameField: UITextField!
    
 
    @IBAction func tapUpdate(_ sender: UIButton) {
        guard let name=NameField.text, !name.isEmpty
           
        else{
                  return Alert()
              }
        
        AppDelegate.GlobalVariable.categorylist.testCategorylist.UpdateCategory(id: AppDelegate.GlobalVariable.selectedCategory, name: name)
    }
 
    
    func Alert (){
        
        let alertController = UIAlertController(title:"Info",message:"Valid input", preferredStyle:  .alert)
        let OKAction = UIAlertAction(title: "OK", style:  .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController,animated:true,completion: nil)
    }
    func Alert1 (){
        
        let alertController = UIAlertController(title:"Info",message:"Please select a Category", preferredStyle:  .alert)
        let OKAction = UIAlertAction(title: "OK", style:  .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController,animated:true,completion: nil)
    }
    
}
