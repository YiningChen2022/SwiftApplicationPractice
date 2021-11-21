//
//  CreateCategoryViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/12/21.
//

import UIKit
import CoreData
class CreateCategoryViewController: UIViewController {
    var context: NSManagedObjectContext=(UIApplication.shared.delegate as! AppDelegate).managedObjectContext!
 
    @IBOutlet weak var NameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func didTapCreate(_ sender: UIButton) {
        guard let name=NameField.text, !name.isEmpty

        else{
                  return Alert()
              }
        //creat a Category object
        let newCategoryCore = CategoryCore(context: self.context)
        newCategoryCore.name=name
        //save data
        do {
            try! self.context.save()
            
        }catch{
            
        }

    }
    func Alert (){
        
        let alertController = UIAlertController(title:"Info",message:"Valid input", preferredStyle:  .alert)
        let OKAction = UIAlertAction(title: "OK", style:  .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController,animated:true,completion: nil)
    }
    
}
