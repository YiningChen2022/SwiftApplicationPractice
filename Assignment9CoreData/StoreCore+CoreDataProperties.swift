//
//  StoreCore+CoreDataProperties.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/21/21.
//
//

import Foundation
import CoreData


extension StoreCore {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StoreCore> {
        return NSFetchRequest<StoreCore>(entityName: "StockCore")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var company: CompanyCore?
    @NSManaged public var lastTradePrice: Double
    @NSManaged public var financialRating: Int64
    @NSManaged public var category: CategoryCore?

}

extension StoreCore : Identifiable {

}
