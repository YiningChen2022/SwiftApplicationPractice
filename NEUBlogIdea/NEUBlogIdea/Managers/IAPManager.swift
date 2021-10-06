//
//  IAPManager.swift
//  NEUBlogIdea
//
//  Created by Yining Chen on 10/5/21.
//

import Foundation
import Purchases

final class IAPManager{
    static let shared = IAPManager()
    private init(){}
    func isPremium()->Bool{
        return false;
    }
    func subscribe(){}
    func restorePurchases(){}
}
