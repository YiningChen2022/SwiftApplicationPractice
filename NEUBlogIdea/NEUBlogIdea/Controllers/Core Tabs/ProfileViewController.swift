//
//  ProfileViewController.swift
//  NEUBlogIdea
//
//  Created by Yining Chen on 10/4/21.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem=UIBarButtonItem(
            title:"Sign out",
            style: .done,
            target: self,
            action: #selector(didTapSignOut)
        )
        // Do any additional setup after loading the view.
    }
    @objc private func didTapSignOut(){
        let sheet = UIAlertController(title: "Sign Out", message: "Are you sure?", preferredStyle: .actionSheet)
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        sheet.addAction(UIAlertAction(title: "Sign Out", style: .destructive, handler: { _ in
            AuthManager.shared.signOut{[weak self]success in
                if success{
                    DispatchQueue.main.async {
                        UserDefaults.standard.set (nil, forKey:"email")
                        UserDefaults.standard.set (nil, forKey:"name")
                        let signInVC=SigninViewController();
        
                        signInVC.navigationItem.largeTitleDisplayMode = .always
                        let navVC = UINavigationController(rootViewController: signInVC)
                        navVC.navigationBar.prefersLargeTitles=true
                        navVC.modalPresentationStyle = .fullScreen
                        self?.present(navVC, animated: true, completion: nil)
                    }
                }
            }
            
        }))
        present(sheet, animated: true)

    }
    

}
