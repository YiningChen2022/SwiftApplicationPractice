//
//  SignUpViewController.swift
//  NEU_PLUS_thoughts
//
//  Created by Yining Chen on 12/7/21.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var nameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func didTapSignUp(_ sender: UIButton) {
        guard let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty,
              let name=nameField.text,
              !name.isEmpty else {
                  return
              }
        
        AuthManager.shared.signUp(email: email, password: password){[weak self]
            success in if success{
                //update database
                let newUser = User(name:name, email:email,profulePictureUrl: nil)
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
    

}
