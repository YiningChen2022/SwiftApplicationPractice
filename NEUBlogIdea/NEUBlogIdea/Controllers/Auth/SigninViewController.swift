//
//  SigninViewController.swift
//  NEUBlogIdea
//
//  Created by Yining Chen on 10/4/21.
//

import UIKit

class SigninViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign In"
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
        DispatchQueue.main.asyncAfter(deadline: .now()+3){
            if !IAPManager.shared.isPremium(){
                let vc=PayWallViewController()
                let navVC = UINavigationController(rootViewController: vc)
                self.present(navVC,animated:true,completion:nil)
            }
        }
    }


}
