//
//  CreateCompanyViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/14/21.
//

import UIKit
import CoreData
class CreateCompanyViewController: UIViewController {
    var context: NSManagedObjectContext=(UIApplication.shared.delegate as! AppDelegate).managedObjectContext!
 
    @IBOutlet weak var HeadQuarter: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Symbol: UITextField!
    @IBOutlet weak var Name: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func nameDone(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func SymbolDone(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func emailDone(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    
    @IBAction func hqDone(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func didTapAdd(_ sender: UIButton) {
        guard let name=Name.text, !name.isEmpty,
              let symbol=Symbol.text, !symbol.isEmpty,
              let headQuarter=HeadQuarter.text, !headQuarter.isEmpty,
              let email=Email.text,!email.isEmpty,isValidEmail(email: email)
        else{
                  return Alert()
              }
        //creat a Category object
        let newCompanyCore = CompanyCore(context: self.context)
        newCompanyCore.name=name
        newCompanyCore.symbol=symbol
        newCompanyCore.headQuarter=headQuarter
        newCompanyCore.email=email
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
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
