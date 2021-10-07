//
//  IAPManager.swift
//  NEUBlogIdea
//
//  Created by Yining Chen on 10/5/21.
//

import Foundation
import Purchases
import StoreKit

final class IAPManager{
    static let shared = IAPManager()
    private init(){}
    func isPremium()->Bool{
        return UserDefaults.standard.bool(forKey: "premium");
    }
    public func getSubscruptionStatus(){
        Purchases.shared.purchaserInfo{info, error in
            guard let entitlements=info?.entitlements,
                  error==nil else{
                      return
                  }
            print(entitlements)
        }
        
    }
    public func fetchPackages(completion:@escaping(Purchases.Package?)->Void){
        Purchases.shared.offerings{
            offerings,error in
            guard let package=offerings?.offering (identifier:"default")?.availablePackages.first,
                  error == nil else{
                      completion(nil)
                      return
                      
                  }
            completion(package)
                  }
        
    }
    public func subscribe(package: Purchases.Package){
        guard !isPremium() else{
            "User already Sub"
            return
        }
        Purchases.shared.purchasePackage(package){
            transaction, info, error, userCancelled in
            guard let transaction = transaction,
                  let entitlements = info?.entitlements,
                    error==nil,
                  !userCancelled else{
                      return
                  }
            switch transaction.transactionState{
            case .purchasing:
                print("purchasing")
            case .purchased:
                print("Purchased:\(entitlements)")
                UserDefaults.standard.set(true,forKey:"premium")
            case .failed:
                print("failed")
            case .restored:
                print("restored")
            case .deferred:
                print("deferred")
            @unknown default:
                print("default case")
            }
        }
    }
    public func restorePurchases(){
        Purchases.shared.restoreTransactions{info, error in
            guard let entitlements = info?.entitlements,
                  error == nil else{
                      return
                  }
            print ("Restored: \(entitlements)")
        }
    }
}
