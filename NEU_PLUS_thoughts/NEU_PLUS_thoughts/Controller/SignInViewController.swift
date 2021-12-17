//
//  SignInViewController.swift
//  NEU_PLUS_thoughts
//
//  Created by Yining Chen on 12/7/21.
//

import UIKit

class SignInViewController: UIViewController {

    var secure=true
    @IBOutlet weak var emialField: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        password.isSecureTextEntry=true

        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickviewpassword(_ sender: UIButton) {
        if secure{
            secure=false
            password.isSecureTextEntry=false
        }else{
            secure=true
            password.isSecureTextEntry=true
        }
        
    }
    
    @IBAction func didTapSignIn(_ sender: UIButton) {
        guard let email = emialField.text, !email.isEmpty, isValidEmail(email: email),
              let password = password.text, !password.isEmpty
        else {
            return Alert ()
        }
        
        AuthManager.shared.signIn(email: email, password: password){[ weak self] success in
            guard  success  else{
                return self!.Alert1 ()
            }
            
            UserDefaults.standard.set(email, forKey:"email")
            DispatchQueue.main.async {
               
                let vc=self?.storyboard?.instantiateViewController(withIdentifier: "Home") as? TabBarViewController
                vc!.modalPresentationStyle = .fullScreen
                self?.present (vc!, animated:true)
            }
        }
    }
    func Alert (){
        
        let alertController = UIAlertController(title:"Info",message:"Wrong Input, Please try Again", preferredStyle:  .alert)
        let OKAction = UIAlertAction(title: "OK", style:  .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController,animated:true,completion: nil)
    }
    
    func Alert1 (){
        
        let alertController = UIAlertController(title:"Info",message:"Could not find this user or wrong password input", preferredStyle:  .alert)
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
