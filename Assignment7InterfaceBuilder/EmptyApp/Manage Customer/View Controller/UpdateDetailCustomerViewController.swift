//
//  UpdateDetailCustomerViewController.swift
//  EmptyApp
//
//  Created by Yining Chen on 11/3/21.
//  Copyright © 2021 rab. All rights reserved.
//

import UIKit

class UpdateDetailCustomerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
         let customer = AppDelegate.GlobalVariable.customerlist.testcustomerlist.getCustomer(id: AppDelegate.GlobalVariable.selected)
        FirstNameField.text=customer?.getFirstName()
        LastNameField.text=customer?.getLastName()
        EmailField.text=customer?.getEmailID()
        AddressField.text=customer?.getAddress()
        ContactField.text=customer?.getContactDetails()

        // Do any additional setup after loading the view.
    }
    
   
    @IBOutlet weak var FirstNameField: UITextField!
    @IBOutlet weak var LastNameField: UITextField!
    @IBOutlet weak var EmailField: UITextField!
    @IBOutlet weak var AddressField: UITextField!
    @IBOutlet weak var ContactField: UITextField!
    
    
    @IBAction func EmailDone(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    @IBAction func FirstNameDone(_ sender: UITextField) { sender.resignFirstResponder()
    }
    @IBAction func LastNameDone(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    @IBAction func Contact(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    

    
    @IBAction func AddressDone(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func didTapUpdateCustomer(_ sender: Any) {
        guard let email=EmailField.text,!email.isEmpty,
                let firstName=FirstNameField.text,!firstName.isEmpty,
                let lastName=LastNameField.text,!lastName.isEmpty,
              let contact=ContactField.text,!contact.isEmpty, Int(contact) != nil,
              let address = AddressField.text,!address.isEmpty
        else{
            return Alert()
            
        }

     
    
        AppDelegate.GlobalVariable.customerlist.testcustomerlist.UpdateCustomer(id: AppDelegate.GlobalVariable.selected, firstName: firstName, lastName: lastName, address: address, contactDetails: contact, emailId: email)

        let vc = ManageCustomerViewController()
           self.present(vc, animated: true, completion: nil)
        
    }
        
        
        
    
    func Alert (){
        
        let alertController = UIAlertController(title:"Info",message:"Valid input", preferredStyle:  .alert)
        let OKAction = UIAlertAction(title: "OK", style:  .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController,animated:true,completion: nil)
    }
    
    
    @IBAction func CloseWindow(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
    }
    
    
    
    
}
