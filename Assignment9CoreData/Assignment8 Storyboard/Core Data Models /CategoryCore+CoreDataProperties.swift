//
//  CategoryCore+CoreDataProperties.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/20/21.
//
//

import Foundation
import CoreData


extension CategoryCore {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CategoryCore> {
        return NSFetchRequest<CategoryCore>(entityName: "CategoryCore")
    }

    @NSManaged public var name: String?

}

extension CategoryCore : Identifiable {

}
