//
//  AddCustomerViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/11/21.
//

import UIKit
import CoreData
class AddCustomerViewController: UIViewController {
    var context: NSManagedObjectContext=(UIApplication.shared.delegate as! AppDelegate).managedObjectContext!
 
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var contactDetail: UITextField!
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var Address: UITextField!
    @IBOutlet weak var lastName: UITextField!
    
    
    @IBAction func FirstNameDone(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func lastNameDone(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    
    @IBAction func AddressDone(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func EmailDone(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func DidTapAddCustomer(_ sender: UIButton) {
        guard let em=email.text, !em.isEmpty,isValidEmail(email: em),
              let fn=firstName.text, !fn.isEmpty,
              let ln=lastName.text, !ln.isEmpty,
              let contact=contactDetail.text,!contact.isEmpty, Int(contact) != nil, contact.count==10,
              let addre = Address.text,!addre.isEmpty
        else{
                  return Alert()
              }
        let newCustomerCore = CustomerCore(context: self.context)
        newCustomerCore.firstName=fn
        newCustomerCore.lastName=ln
        newCustomerCore.contactDetails=Int64(contact)!
        newCustomerCore.address=addre
        newCustomerCore.emailID=em
        
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
