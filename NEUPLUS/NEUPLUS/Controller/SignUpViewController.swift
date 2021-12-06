//
//  SignUpViewController.swift
//  NEUPLUS
//
//  Created by Yining Chen on 12/6/21.
//

import UIKit

class SignUpViewController: UITabBarController {
    
    
    @IBOutlet weak var emaillTextField: UITextField!
    
    @IBOutlet weak var NameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didChange(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            
        }else if sender.selectedSegmentIndex == 1{
            
        }else if sender.selectedSegmentIndex == 2 {
            
        }
    }
    
    @IBAction func DidTapSignUp(_ sender: UIButton) {
        guard let email = emaillTextField.text, !email.isEmpty,
              let password = passwordTextField.text,!password.isEmpty,
              let name = NameTextField.text,!name.isEmpty else {
                  return
              }
        //Create User
        AuthManage.shared.signUp(email: email, password: password){[weak self]
            success in
            if success{
                //Update to database
                let newUser = User(name: name, email: email, profilePicURL: nil)
                DatabaseManage.shared.insertUser(user: newUser){
                    inserted in
                    guard inserted else{
                        return
                    }
                    DispatchQueue.main.async {
                        let vc=HomeViewController()
                        vc.modalPresentationStyle = .fullScreen
                        self?.present(vc,animated: true)
                        
                    }
                    
                    
                    
                    
                }
            }else{
                print("Failed to Create account")
            }
        }
   
        
        
    }
    
}
