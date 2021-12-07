//
//  ViewController.swift
//  NEU_PLUS_thoughts
//
//  Created by Yining Chen on 12/7/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func DIDtapButton(_ sender: Any) {
        let vc: UIViewController
        if AuthManager.shared.isSignedIn{
            vc=(storyboard?.instantiateViewController(withIdentifier: "Home") as? TabBarViewController)!
            
        }else {
            vc=(storyboard?.instantiateViewController(withIdentifier: "SignIn") as? SignInViewController)!
            }
        vc.modalPresentationStyle = .fullScreen 
        present (vc, animated:true)
    }
    
        
    
}

