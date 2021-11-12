//
//  AddCustomerViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/11/21.
//

import UIKit

class AddCustomerViewController: UIViewController {

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
        guard let em=email.text, !em.isEmpty,
              let fn=firstName.text, !fn.isEmpty,
              let ln=lastName.text, !ln.isEmpty,
              let contact=contactDetail.text,!contact.isEmpty, Int(contact) != nil,
              let addre = Address.text,!addre.isEmpty
        else{
                  return Alert()
              }
        let customer = Customer(firstName: fn, lastName: ln, address: addre, contactDetails: contact, emailID: em)
        
        AppDelegate.GlobalVariable.customerlist.testcustomerlist.addCustomer(Customer: customer)

        }
  
    
    func Alert (){
        
        let alertController = UIAlertController(title:"Info",message:"Valid input", preferredStyle:  .alert)
        let OKAction = UIAlertAction(title: "OK", style:  .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController,animated:true,completion: nil)
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
