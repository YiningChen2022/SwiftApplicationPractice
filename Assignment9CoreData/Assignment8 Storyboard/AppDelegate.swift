//
//  AppDelegate.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/11/21.
//

import UIKit
import CoreData
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var managedObjectContext:NSManagedObjectContext? = nil
    

    struct GlobalVariable{
        
        public static var CategoryCoreitems:[CategoryCore]?
        public static var CompanyCoreitems:[CompanyCore]?
        public static var CustomerCoreitems:[CustomerCore]?
        public static var StockCoreitems:[StockCore]?
        
        
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
 
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        managedObjectContext = self.persistenContainer.viewContext
        
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
    lazy var persistenContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Assignment8 Storyboard")
        container.loadPersistentStores(completionHandler:{(storeDescription, error) in
            if let error = error as NSError?{
                fatalError("Unresolved error\(error),\(error.userInfo)")
            }
        })
        return container
    }()
    func saveContext(){
        let context = persistenContainer.viewContext
        if context.hasChanges{
            do{
                try context.save()
            }catch {
                let nserror = error as NSError
                fatalError("Unresolved error\(nserror),\(nserror.userInfo)")
            }
        }
    }
}


