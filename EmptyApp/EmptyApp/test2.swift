//
//  test2.swift
//  EmptyApp
//
//  Created by Yining Chen on 10/30/21.
//  Copyright © 2021 rab. All rights reserved.
//

import Foundation

import UIKit

class test2: UIWindow{
   
    //header
    private let label: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x:70,y:60,width: 200,height: 50)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.text = "yes"
        return label
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
  
        self.addSubview(label)

        return true
    }
   
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func updateData(title:String){
        //self.label.text = title
    }
     
     
    
 
}
