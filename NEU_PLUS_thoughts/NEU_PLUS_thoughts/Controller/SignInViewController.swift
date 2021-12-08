//
//  SignInViewController.swift
//  NEU_PLUS_thoughts
//
//  Created by Yining Chen on 12/7/21.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var emialField: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func didTapSignIn(_ sender: UIButton) {
        guard let email = emialField.text, !email.isEmpty,
              let password = password.text, !password.isEmpty
        else {
            return
        }
    }
    
}
