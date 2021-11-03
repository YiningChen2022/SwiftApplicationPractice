//
//  AddCustomerViewController.swift
//  EmptyApp
//
//  Created by Yining Chen on 11/2/21.
//  Copyright © 2021 rab. All rights reserved.
//

import UIKit

class AddCustomerViewController: UIViewController {

    
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    
    
    @IBOutlet weak var Address: UITextField!
    
    
    @IBOutlet weak var contactDetail: UITextField!
    
    @IBOutlet weak var email: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
 
    }
    
    @IBAction func Done(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    
    @IBAction func LastNameDone(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    
    @IBAction func AddressDone(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func ContactDone(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    
    @IBAction func EmailDone(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func DidTapAddCustomer(_ sender: UIButton) {
        guard let em=email.text, !em.isEmpty,
              let fn=firstName.text, !fn.isEmpty,
              let ln=lastName.text, !ln.isEmpty,
              let contact=contactDetail.text,!contact.isEmpty,
              let addre = Address.text,!addre.isEmpty
        else{
                  return
              }
        let customer = Customer(firstName: fn, lastName: ln, address: addre, contactDetails: contact, emailID: em)
        
        AppDelegate.GlobalVariable.customerlist.testcustomerlist.addCustomer(Customer: customer)
        print(customer.toString())
        dismiss(animated: true, completion: nil)
        }
  
    
    
    

    @IBAction func CloseWindow(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
