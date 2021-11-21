//
//  CompanyCore+CoreDataProperties.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/20/21.
//
//

import Foundation
import CoreData
import UIKit
extension CompanyCore {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CompanyCore> {
        return NSFetchRequest<CompanyCore>(entityName: "CompanyCore")
    }

    @NSManaged public var name: String?
    @NSManaged public var symbol: String?
    @NSManaged public var email: String?
    @NSManaged public var headQuarter: String?
    @NSManaged public var logo: UIImage?

}

extension CompanyCore : Identifiable {

}
