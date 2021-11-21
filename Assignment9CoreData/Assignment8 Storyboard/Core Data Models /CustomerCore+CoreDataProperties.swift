//
//  CustomerCore+CoreDataProperties.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/21/21.
//
//

import Foundation
import CoreData


extension CustomerCore {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CustomerCore> {
        return NSFetchRequest<CustomerCore>(entityName: "CustomerCore")
    }

    @NSManaged public var address: String?
    @NSManaged public var contactDetails: Int64
    @NSManaged public var emailID: String?
    @NSManaged public var firstName: String?
    @NSManaged public var id: UUID?
    @NSManaged public var lastName: String?
    @NSManaged public var totalEarning: Double
    @NSManaged public var totalInvestment: Double

}

extension CustomerCore : Identifiable {

}
