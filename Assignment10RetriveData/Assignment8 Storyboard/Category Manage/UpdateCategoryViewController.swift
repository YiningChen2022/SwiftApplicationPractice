//
//  UpdateCategoryViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/12/21.
//

import UIKit
import CoreData
class UpdateCategoryViewController: UIViewController {
    var context: NSManagedObjectContext=(UIApplication.shared.delegate as! AppDelegate).managedObjectContext!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        if((CategoryTableViewController.choosedCategory) == nil){
            Alert1()
            
        }else{
            NameField.text=CategoryTableViewController.choosedCategory!.name
        }
    
     
        
       
    }
    
  
    @IBOutlet weak var NameField: UITextField!
    
 
    @IBAction func tapUpdate(_ sender: UIButton) {
        guard let name=NameField.text, !name.isEmpty
           
        else{
                  return Alert()
              }
        CategoryTableViewController.choosedCategory?.name=name
        do{
            try self.context.save()
        }catch{
            
        }
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
