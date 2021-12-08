//
//  ProfileViewController.swift
//  NEU_PLUS_thoughts
//
//  Created by Yining Chen on 12/7/21.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    @IBAction func didTapSignOut(_ sender: UIBarButtonItem) {
        let sheet = UIAlertController(title: "Sign Out", message: nil,preferredStyle: .actionSheet)
        sheet.addAction(UIAlertAction(title:"cancel", style: .cancel, handler: nil))
        sheet.addAction(UIAlertAction(title:"Sign Out", style: .destructive, handler: { _ in
            AuthManager.shared.signOut{
                [ weak self]
               
                success in if success{
                    DispatchQueue.main.async {
                        
                        UserDefaults.standard.set(nil, forKey:"email")
                        UserDefaults.standard.set(nil, forKey:"name")
                        let vc=self?.storyboard?.instantiateViewController(withIdentifier: "SignIn") as? SignInViewController
                        vc!.modalPresentationStyle = .fullScreen
                        self?.present (vc!, animated:true,completion:nil)
                    }
                }
            }
            
        }))
        present(sheet, animated: true)
        
      
    }
}
