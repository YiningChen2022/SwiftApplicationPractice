//
//  UpdateCustomerViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/12/21.
//

import UIKit

class UpdateCustomerViewController: UIViewController {

    override func viewDidLoad() {
        if (AppDelegate.GlobalVariable.selected==0){
            Alert1()
        }else{
        let customer = AppDelegate.GlobalVariable.customerlist.testcustomerlist.getCustomer(id: AppDelegate.GlobalVariable.selected)
       FirstNameField.text=customer?.getFirstName()
       LastNameField.text=customer?.getLastName()
       EmailField.text=customer?.getEmailID()
       AddressField.text=customer?.getAddress()
       ContactField.text=customer?.getContactDetails()
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
        guard let email=EmailField.text,!email.isEmpty,
              let firstName=FirstNameField.text,!firstName.isEmpty,
              let lastName=LastNameField.text,!lastName.isEmpty,
              let contact=ContactField.text,!contact.isEmpty, Int(contact) != nil,
              let address = AddressField.text,!address.isEmpty
        else{
            return Alert()
        }
        AppDelegate.GlobalVariable.customerlist.testcustomerlist.UpdateCustomer(id: AppDelegate.GlobalVariable.selected, firstName: firstName, lastName: lastName, address: address, contactDetails: contact, emailId: email)

        
        
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
}
