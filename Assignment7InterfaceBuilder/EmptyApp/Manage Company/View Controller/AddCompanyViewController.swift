//
//  AddCompanyViewController.swift
//  EmptyApp
//
//  Created by Yining Chen on 11/3/21.
//  Copyright © 2021 rab. All rights reserved.
//

import UIKit

class AddCompanyViewController: UIViewController {

    @IBOutlet weak var Name: UITextField!
    
    @IBOutlet weak var Symbol: UITextField!
    
    @IBOutlet weak var Email: UITextField!
    
    @IBOutlet weak var HeadQuarter: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapAddCompany(_ sender: UIButton) {
        guard let name=Name.text, !name.isEmpty,
              let symbol=Symbol.text, !symbol.isEmpty,
              let headQuarter=HeadQuarter.text, !headQuarter.isEmpty,
              let email=Email.text,!email.isEmpty
        else{
                  return Alert()
              }
        let company = Company(name: name, symbol: symbol, headquarter: headQuarter, email: email)
        AppDelegate.GlobalVariable.companylist.testCompanylist.addCompany(Company: company)
        dismiss(animated: true, completion: nil)
      

        
    }
    func Alert (){
        
        let alertController = UIAlertController(title:"Info",message:"Valid input", preferredStyle:  .alert)
        let OKAction = UIAlertAction(title: "OK", style:  .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController,animated:true,completion: nil)
    }
    
    @IBAction func didemail(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    @IBAction func closeWindow(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func didname(_ sender: UITextField) {
        sender.resignFirstResponder()
    }

    
    @IBAction func didsymbol(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    
    @IBAction func didHeadQuarter(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    
    
}
