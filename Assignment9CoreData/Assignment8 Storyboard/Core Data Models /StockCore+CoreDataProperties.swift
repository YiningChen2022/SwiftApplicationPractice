//
//  StockCore+CoreDataProperties.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/21/21.
//
//

import Foundation
import CoreData


extension StockCore {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StockCore> {
        return NSFetchRequest<StockCore>(entityName: "StockCore")
    }

    @NSManaged public var financialRating: Int64
    @NSManaged public var id: UUID?
    @NSManaged public var lastTradePrice: Double
    @NSManaged public var name: String?
    @NSManaged public var ofCategory: CategoryCore?
    @NSManaged public var ofCompany: CompanyCore?

}

extension StockCore : Identifiable {

}
