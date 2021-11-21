//
//  CategoryCore+CoreDataProperties.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/21/21.
//
//

import Foundation
import CoreData


extension CategoryCore {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CategoryCore> {
        return NSFetchRequest<CategoryCore>(entityName: "CategoryCore")
    }

    @NSManaged public var name: String?
    @NSManaged public var stockCore: StockCore?

}

extension CategoryCore : Identifiable {

}
