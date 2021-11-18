//
//  UpdateCompanyViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/14/21.
//

import UIKit

class UpdateCompanyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let id = AppDelegate.GlobalVariable.selectedCompany

        if (id==0){
            Alert1()
        }else{
       let currentCompany=AppDelegate.GlobalVariable.companylist.testCompanylist.getCompany(id: id)
       
         
         Name.text=currentCompany?.getName()
         hq.text = currentCompany?.getHeadquarter()
         Symbol.text=currentCompany?.getSymbol()
         Email.text=currentCompany?.getEmail()
            
        }// Do any additional setup after loading the view.
    }
    func Alert1 (){
        
        let alertController = UIAlertController(title:"Info",message:"Please select a Category", preferredStyle:  .alert)
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
              let email=Email.text,!email.isEmpty
        else{
                  return Alert()
              }
        AppDelegate.GlobalVariable.companylist.testCompanylist.UpdateCompany(id: AppDelegate.GlobalVariable.selectedCompany, symbol: symbol, headquarter: headQuarter, email: email)

    }
    func Alert (){
        
        let alertController = UIAlertController(title:"Info",message:"Valid input", preferredStyle:  .alert)
        let OKAction = UIAlertAction(title: "OK", style:  .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController,animated:true,completion: nil)
    }
}
