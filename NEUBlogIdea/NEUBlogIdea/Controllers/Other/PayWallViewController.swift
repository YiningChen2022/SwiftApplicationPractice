//
//  PayWallViewController.swift
//  NEUBlogIdea
//
//  Created by Yining Chen on 10/6/21.
//

import UIKit

class PayWallViewController: UITabBarController {
    //title
    private let header = PayWallHeaderView()
    //Header image

    //pricing and product info
    //CTA Button
    //Term of services
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(header)
        setUpCloseButton()
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        header.frame = CGRect(x:0,
                              y:view.safeAreaInsets.top,
                              width: view.width,
                              height: view.height/3.2
        )
    }
    private func setUpCloseButton(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem:  .close, target: self, action: #selector(didTapClose)
        
        
        
        )
    }
    
    @objc private func didTapClose(){
        dismiss(animated: true, completion: nil)
        
    }
    



}
