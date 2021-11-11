//
//  AppDelegate.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/11/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?


   /* struct GlobalVariable{
        public static var customerlist=CustomerManager()
        public static var stocklist=StockManager()
        public static var companylist=CompanyManager()
        public static var categorylist=CategoryManager()
        public static var orderlist=OrderManager()
        public static var SellStocklist=SellStockManager()
        
        public static var selected=0
        public static var selectedCategory=0
        public static var selectedStock=0
        public static var selectedCompany=0
        public static var selectedCompanytoSearch=0
        public static var selectedCategorySearch=0
        public static var selectedNameSearch=""
        public static var selectedFinacialSearch=0
        public static var selectedTradeSearch=0
        public static var selectedOrderid=0
        public static var orderedStock:Array<Stock>=[]
        public static var sellStockid=0
     }
    */
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

