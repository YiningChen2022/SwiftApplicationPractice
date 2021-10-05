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
        
    }
    

}
