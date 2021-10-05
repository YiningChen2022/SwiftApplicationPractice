//
//  TabBarViewController.swift
//  NEUBlogIdea
//
//  Created by Yining Chen on 10/4/21.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .link
        setUpControllers()
    }
    func setUpControllers(){
        let home=HomeViewController();
        let profile=ProfileViewController();
        home.title="Home"
        profile.title="Profile"
        home.navigationItem.largeTitleDisplayMode = .always
        profile .navigationItem.largeTitleDisplayMode = .always
        //wrapping for flexible ui
        let nav1=UINavigationController(rootViewController: home);
        let nav2=UINavigationController(rootViewController: profile);
        
        nav1.navigationBar.prefersLargeTitles=true
        nav2.navigationBar.prefersLargeTitles=true
        nav1.tabBarItem=UITabBarItem(title: "Home", image:UIImage(systemName:"house"), tag: 1)
        nav2.tabBarItem=UITabBarItem(title: "Profile", image:UIImage(systemName:"person.circle"), tag: 2)
        
        setViewControllers([nav1,nav2], animated: true)
        
    }
    

}
