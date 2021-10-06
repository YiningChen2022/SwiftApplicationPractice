//
//  PayWallViewController.swift
//  NEUBlogIdea
//
//  Created by Yining Chen on 10/6/21.
//

import UIKit

class PayWallViewController: UITabBarController {
    //title
    
    //Header image
    private let headerImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "crown.fill"))
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    //pricing and product info
    //CTA Button
    //Term of services
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
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
