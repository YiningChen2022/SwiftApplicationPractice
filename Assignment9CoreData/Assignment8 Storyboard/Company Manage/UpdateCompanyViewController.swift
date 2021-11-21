//
//  UpdateCompanyViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/14/21.
//

import UIKit
import CoreData
class UpdateCompanyViewController: UIViewController {
    var context: NSManagedObjectContext=(UIApplication.shared.delegate as! AppDelegate).managedObjectContext!
 let currCompany = CompanyTableViewController.choosedCompany
    override func viewDidLoad() {
        super.viewDidLoad()
     
        if ((currCompany) == nil){
            Alert1()
        }else{
           
        Name.text=currCompany!.name
         hq.text=currCompany!.headQuarter
         Symbol.text=currCompany!.symbol
         Email.text=currCompany!.email
            
        }// Do any additional setup after loading the view.
    }
    func Alert1 (){
        
        let alertController = UIAlertController(title:"Info",message:"Please select a Company", preferredStyle:  .alert)
        let OKAction = UIAlertAction(title: "OK", style:  .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController,animated:true,completion: nil)
    }
    
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var hq: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Symbol: UITextField!
    
    @IBAction func NameDone(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func EmailDone(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
  
    @IBAction func hqdone(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    @IBAction func SymbolDone(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    
    @IBAction func didTapUpdate(_ sender: UIButton) {
        guard let name=Name.text, !name.isEmpty,
              let symbol=Symbol.text, !symbol.isEmpty,
              let headQuarter=hq.text, !headQuarter.isEmpty,
              let email=Email.text,!email.isEmpty,isValidEmail(email: email)
        else{
                  return Alert()
              }
        currCompany?.name=name
        currCompany?.headQuarter=headQuarter
        currCompany?.symbol=symbol
        currCompany?.email=email
        
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
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
