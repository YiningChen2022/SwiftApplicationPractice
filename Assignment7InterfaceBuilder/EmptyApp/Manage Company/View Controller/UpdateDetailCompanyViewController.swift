//
//  UpdateDetailCompanyViewController.swift
//  EmptyApp
//
//  Created by Yining Chen on 11/3/21.
//  Copyright © 2021 rab. All rights reserved.
//

import UIKit

class UpdateDetailCompanyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       let id = AppDelegate.GlobalVariable.selectedCompany
      let currentCompany=AppDelegate.GlobalVariable.companylist.testCompanylist.getCompany(id: id)
        
        
        Name.text=currentCompany?.getName()
        hq.text = currentCompany?.getHeadquarter()
        Symbol.text=currentCompany?.getSymbol()
        Email.text=currentCompany?.getEmail()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var Name: UITextField!
    
    @IBOutlet weak var hq: UITextField!
    @IBOutlet weak var Symbol: UITextField!
    
    @IBOutlet weak var Email: UITextField!
    
    
    @IBAction func didName(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func didSymbol(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    
    @IBAction func didEmail(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    
    @IBAction func didHQ(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    
    @IBAction func DidTapUpdate(_ sender: UIButton) {
        guard let name=Name.text, !name.isEmpty,
              let symbol=Symbol.text, !symbol.isEmpty,
              let headQuarter=hq.text, !headQuarter.isEmpty,
              let email=Email.text,!email.isEmpty
        else{
                  return Alert()
              }
        AppDelegate.GlobalVariable.companylist.testCompanylist.UpdateCompany(id: AppDelegate.GlobalVariable.selectedCompany, symbol: symbol, headquarter: headQuarter, email: email)
        let vc = ManageCompanyViewController()
           self.present(vc, animated: true, completion: nil)
    }
    func Alert (){
        
        let alertController = UIAlertController(title:"Info",message:"Valid input", preferredStyle:  .alert)
        let OKAction = UIAlertAction(title: "OK", style:  .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController,animated:true,completion: nil)
    }
    
}
