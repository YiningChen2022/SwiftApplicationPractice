//
//  main.swift
//  Assignment5
//
//  Created by Yining Chen on 10/20/21.
//

import Foundation

print("Hello, World!")


class Company {
    static var nextUid:Int = 0
    static func generateUid() -> Int {
         nextUid+=1
        return nextUid
    }
    let id: Int
    var  name : String
    var  symbol : String
    var  headquarter: String
    var  email: String
    init(name : String,symbol : String,headquarter: String, email: String) {
        self.name=name
        self.symbol=symbol
        self.headquarter=headquarter
        self.email=email
        self.id=Company.generateUid()
       
    }
    public func getid()->Int{
        return id
    }
    public func getName()->String {
        return name
    }
    public func setName(name :String){
        self.name=name
    }
    public func getSymbol()->String {
        return symbol
    }
    public func setSymbol(symbol:String){
        self.symbol=symbol
    }
    public func getHeadquarter()->String {
        return headquarter
    }
    public func setHeadquarter(headquarter:String){
        self.headquarter=headquarter
    }
    public func getEmail()->String {
        return email
    }
    public func setEmail(email :String){
        self.email=email
    }
    public func toString ()->String{
        return "Company:\(id) \(name) \(symbol) \(headquarter) \(email)"
    }
}

class CompanyDirecrtory {
    var companyList: [Company]
    init(companyList:Array<Company>){
        self.companyList = []
    }
    public func addCompany(Company:Company){
        companyList.append(Company)
    }
    public func DeleteCompany(id:Int){
        for (index, value) in companyList.enumerated() {
            if value.id==id {
                companyList.remove(at: index)
            }
            
        }
    }
    public func UpdateCompany (id:Int,name:String?, headquarter: String?, email:String?){
        for (index, value) in companyList.enumerated() {
            if value.id==id {
                companyList.remove(at: index)
                company
            }
            
        }
    }
    
}


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
}
class CustomerDirecrtory {
    var customerList: [Customer]
    init(customerList:Array<Customer>){
        self.customerList = []
    }
}

class Category{
    static var nextUid:Int = 0
    static func generateUid() -> Int {
         nextUid+=1
        return nextUid
    }
    var id:Int
    var name: String
    init(name: String){
        self.id=Category.generateUid()
        self.name=name
    }
}

class Stock{
    static var nextUid:Int = 0
    static func generateUid() -> Int {
         nextUid+=1
        return nextUid
    }
    var  id: Int
    var  name : String
    var  company: Company
    var  lastTradePrice: Double
    var  financialRating: Int
    var  Category: Category
    init(name : String,lastTradePrice: Double ,financialRating: Int ,category: Category,company:Company) {
        self.Category=category
        self.id=Stock.generateUid()
        self.name=name
        self.lastTradePrice=lastTradePrice
        self.financialRating=financialRating
        self.company=company
    }
}
var company1 = Company(name: "Google", symbol: "google", headquarter: "Mountain View", email: "google@gmail.com")
CompanyDirecrtory.

