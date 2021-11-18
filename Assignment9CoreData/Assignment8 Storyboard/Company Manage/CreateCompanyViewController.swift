//
//  CreateCompanyViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/14/21.
//

import UIKit

class CreateCompanyViewController: UIViewController {

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
              let email=Email.text,!email.isEmpty
        else{
                  return Alert()
              }
        let company = Company(name: name, symbol: symbol, headquarter: headQuarter, email: email)
        AppDelegate.GlobalVariable.companylist.testCompanylist.addCompany(Company: company)
      
      

    }
    func Alert (){
        
        let alertController = UIAlertController(title:"Info",message:"Valid input", preferredStyle:  .alert)
        let OKAction = UIAlertAction(title: "OK", style:  .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController,animated:true,completion: nil)
    }
    
}
