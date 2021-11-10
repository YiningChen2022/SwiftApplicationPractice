//
//  Customer.swift
//  Assignment5
//
//  Created by Yining Chen on 10/24/21.
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
    init(  firstName : String, lastName: String, address: String, contactDetails: String,emailID: String) {
        self.id=Customer.generateUid()
        self.firstName=firstName
        self.lastName=lastName
        self.address=address
        self.contactDetails=contactDetails
        self.emailID=emailID
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
    public func toString ()->String{
        return "\(id) FN: \(firstName) LN: \(lastName) Address: \(address) Email: \(emailID) Contact: \(contactDetails)"
    }
}
