//
//  SignUpViewController.swift
//  NEU_PLUS_thoughts
//
//  Created by Yining Chen on 12/7/21.
//

import UIKit

class SignUpViewController: UIViewController {
    
    var type:String?
    var isSecure=true
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var nameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordField.isSecureTextEntry=true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapEye(_ sender: UIButton) {
        if isSecure{
            isSecure=false
            passwordField.isSecureTextEntry=false
        }else{
            isSecure=true
            passwordField.isSecureTextEntry=true
        }
        
    }
    
    
    @IBAction func didChangeSegment(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            type="Student"
        }else if sender.selectedSegmentIndex == 1 {
            type="Alumi"
        }else if sender.selectedSegmentIndex == 2 {
            type="Visiter"
        }
    }
    
    @IBAction func didTapSignUp(_ sender: UIButton) {
        guard let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty,
              let name=nameField.text,!name.isEmpty  ,
              let type1=type else {
                  return
              }
        
        AuthManager.shared.signUp(email: email, password: password){[weak self]
            success in if success{
                //update database
                let newUser = User(name:name, email:email,profulePictureRef: nil)
                DatabaseManager.shared.insertUser(user: newUser){
                    inserted in
                    guard inserted else{
                        return
                    }
                    UserDefaults.standard.set(email, forKey:"email")
                    UserDefaults.standard.set(name, forKey:"name")
                   // UserDefaults.standard.set(type1, forKey:"type")
                    DispatchQueue.main.async {
                        
                        let vc=self?.storyboard?.instantiateViewController(withIdentifier: "Home") as? TabBarViewController
                        vc!.modalPresentationStyle = .fullScreen
                        self?.present (vc!, animated:true)
                    }
                }
                
            }else {
                print("Failed to create Account")
            }
        }
    }
    

}
