//
//  Customer.swift
//  EmptyApp
//
//  Created by Yining Chen on 11/2/21.
//  Copyright © 2021 rab. All rights reserved.
//

import Foundation
class Customer {
    static var nextUid:Int = 0
    static func generateUid() -> Int {
         nextUid+=1
        return nextUid
    }
    let id: Int
    var  firstName : String
    var  lastName: String
    var address: String
    var contactDetails: String
    var  emailID: String
    var TotalInvestment:Double
    var TotalEarning:Double
    init(  firstName : String, lastName: String, address: String, contactDetails: String,emailID: String) {
        self.id=Customer.generateUid()
        self.firstName=firstName
        self.lastName=lastName
        self.address=address
        self.contactDetails=contactDetails
        self.emailID=emailID
        self.TotalEarning=0.0
        self.TotalInvestment=0.0
    }
    public func getid()->Int{
        return id
    }
    
    public func getFirstName()->String {
        return firstName
    }
    public func setFirstName(firstName :String){
        self.firstName=firstName
    }
    public func getLastName()->String {
        return lastName
    }
    public func setLastName(lastName :String){
        self.lastName=lastName
    }
    public func getAddress()->String {
        return address
    }
    public func setAddress(address :String){
        self.address=address
    }
    public func getContactDetails()->String {
        return contactDetails
    }
    public func setContactDetails(contactDetails :String){
        self.contactDetails=contactDetails
    }
    public func getEmailID()->String {
        return emailID
    }
    public func setEmailID(emailID :String){
        self.emailID=emailID
    }
    public func getTotalInvestment()->Double{
        return TotalInvestment
    }
    public func setTotalInvestment(investment:Double){
        self.TotalInvestment+=investment
    }
    public func getTotalEarning()->Double{
        return TotalEarning
    }
    public func setTotalEarning(Earning:Double){
        self.TotalEarning+=Earning
    }
    public func toString ()->String{
        return "\(id) \(firstName) \(lastName) \(contactDetails) \(address) \(emailID) "
    }
    
}
