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
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        passwordField.isSecureTextEntry=true
        passwordField.textContentType = .oneTimeCode
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func passwordDone(_ sender: UITextField) {
        passwordField.resignFirstResponder()
        
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
  
    
    
  
    
    @IBAction func didTapSignUp(_ sender: UIButton) {
        guard let email = emailField.text, !email.isEmpty,isValidEmail(email: email),
              let password = passwordField.text, !password.isEmpty,
              let name=nameField.text,!name.isEmpty  else {
                  return Alert ()
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
    
    func Alert (){
        
        let alertController = UIAlertController(title:"Info",message:"Wrong Input, Please try Again", preferredStyle:  .alert)
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
