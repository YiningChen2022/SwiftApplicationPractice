//
//  UpdateCustomerViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/12/21.
//

import UIKit
import CoreData
class UpdateCustomerViewController: UIViewController {
    var context: NSManagedObjectContext=(UIApplication.shared.delegate as! AppDelegate).managedObjectContext!
    let currCustomer = ViewCustomerTableViewController.choosedCustomer
    override func viewDidLoad() {
        if (currCustomer==nil){
            Alert1()
        }else{
            

            FirstNameField.text=currCustomer?.firstName
            LastNameField.text=currCustomer?.lastName
            EmailField.text=currCustomer?.emailID
            AddressField.text=currCustomer?.address
            ContactField.text=currCustomer?.contactDetails.description
        super.viewDidLoad()
        }
        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var EmailField: UITextField!
    
    @IBOutlet weak var FirstNameField: UITextField!
    @IBOutlet weak var ContactField: UITextField!
    @IBOutlet weak var AddressField: UITextField!

    @IBOutlet weak var LastNameField: UITextField!
    
    
    
    
    @IBAction func DidTapUpdate(_ sender: UIButton) {
        guard let email=EmailField.text,!email.isEmpty,isValidEmail(email: email),
              let firstName=FirstNameField.text,!firstName.isEmpty,
              let lastName=LastNameField.text,!lastName.isEmpty,
              let contact=ContactField.text,!contact.isEmpty, Int(contact) != nil,contact.count==10,
              let address = AddressField.text,!address.isEmpty
        else{
            return Alert()
        }
        currCustomer?.lastName=lastName
        currCustomer?.firstName=firstName
        currCustomer?.address=address
        currCustomer?.contactDetails=Int64(contact)!
        currCustomer?.emailID=email
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
    func Alert1 (){
        
        let alertController = UIAlertController(title:"Info",message:"Please select a customer", preferredStyle:  .alert)
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
