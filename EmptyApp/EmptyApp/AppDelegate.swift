//
//  AppDelegate.swift
//  EmptyApp
//
//  Created by rab on 02/15/21.
//  Copyright © 2021 rab. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

   
    struct GlobalVariable{
        public static var customerlist=CustomerManager()
        
        public static var selected=0
     }
   

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        if let window = window {
            window.backgroundColor = .systemYellow
            window.rootViewController = UIViewController()
            //window.rootViewController = applicationViewController()
      
            window.makeKeyAndVisible()
        
            window.addSubview(manageCustomerButton)
            window.addSubview(label)
            window.addSubview(manageCompanyButton)
            window.addSubview(manageStockButton)
            window.addSubview(manageCategoryButton)
            window.isUserInteractionEnabled = true
            //viewDidLoad()
                 }

        return true
    }
    //header
    private let label: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x:70,y:60,width: 200,height: 50)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.text = "Welcome!"
        return label
    }()
    
  
    // manageCustomer
    private let manageCustomerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Manage Custmer", for: .normal )
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.frame = CGRect(x:70, y:120, width:200,height:50)
        button.addTarget(self, action:#selector(didTapCustomer),for: .touchUpInside)
    
       
        return button
    }()
    
    //manageCompany
    private let manageCompanyButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x:70, y:200, width:200,height:50)
        button.backgroundColor = .systemBlue
        button.setTitle("Manage Company", for: .normal )
        button.setTitleColor(.white, for: .normal)
  
        return button
    }()
    
    //manageStock
    private let manageStockButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Manage Stock", for: .normal )
        button.setTitleColor(.white, for: .normal)
        button.frame = CGRect(x:70, y:360, width:200,height:50)
        return button
    }()
    
    //manageCategory
    private let manageCategoryButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x:70, y:280, width:200,height:50)
        button.backgroundColor = .systemBlue
        button.setTitle("Manage Category", for: .normal )
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    

    @objc func didTapCustomer(sender: UIButton){
        window?.addSubview(ManagerCustomerView())
        window?.bringSubviewToFront(ManagerCustomerView())

    }
    public func viewDidLoad()
    {
   
    
    }
   
 
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
 
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

