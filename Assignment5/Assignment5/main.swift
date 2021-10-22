//
//  main.swift
//  Assignment5
//
//  Created by Yining Chen on 10/20/21.
//

import Foundation


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
    public func UpdateCompany (id:Int,symbol:String?, headquarter: String?, email:String?){
             for (index, value) in companyList.enumerated() {
                 if value.id==id {
                     if symbol != nil {
                         value.setSymbol(symbol: symbol!)
                     }
                     if  headquarter != nil {
                         value.setHeadquarter(headquarter: headquarter!)
                     }
                     if  email != nil {
                         value.setEmail(email: email!)
                     }
                     
                 }
                 
             }
         }
    public func toString(){
        for company in companyList {
            print (company.toString())
            
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
    public func toString ()->String{
        return "Customer:\(id) \(firstName) \(lastName) \(address) \(contactDetails) \(emailID)"
    }
}
class CustomerDirecrtory {
    var customerList: [Customer]
    init(customerList:Array<Customer>){
        self.customerList = []
    }
    public func addCustomer(Customer:Customer){
        customerList.append(Customer)
    }
    
    public func DeleteCustomer(id:Int){
        for (index, value) in customerList.enumerated() {
            if value.id==id {
                customerList.remove(at: index)
            }
            
        }
    }
    public func UpdateCustomer (id:Int,firstName: String?, lastName:String?, address:String?, contactDetails: String?, emailId:String?){
        for (index, value) in customerList.enumerated() {
            if value.id==id {
                if firstName != nil {
                    value.setFirstName(firstName: firstName!)
                }
                if  lastName != nil {
                    value.setLastName(lastName: lastName!)
                }
                if  address != nil {
                    value.setAddress(address: address!)
                }
                if  contactDetails != nil {
                    value.setContactDetails(contactDetails: contactDetails!)
                }
                if  emailId != nil {
                    value.setEmailID(emailID: emailId!)
                }
            }
            
        }
    }
    public func toString(){
        for customer in customerList {
            print (customer.toString())
            
        }
        
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
    public func getId()->Int {
        return id
    }
    public func getName()->String {
        return name
    }
    public func setName(name :String){
        self.name=name
    }
    public func toString ()->String{
        return "Catagory:\(id) \(name)"
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


print("--------------------Testing------------------")
let testcompanylist = CompanyDirecrtory(companyList: Array())
print("--------------------Adding companies-----------")
var company1 = Company(name: "Google", symbol: "GOOGL", headquarter: "Mountain View", email: "google@gmail.com")
var company2 = Company(name: "Apple", symbol: "AAPL", headquarter: "Mountain View", email: "apple@apple.com")
var company3 = Company(name: "Amazon", symbol: "AMZN", headquarter: "seattle ", email: "amazon@amazon.com")
var company4 = Company(name: "FaceBook", symbol: "FB", headquarter: "Menlo Park,CA", email: "facebook@facebook.com")
print("--------------------view all companies-----------")
testcompanylist.addCompany(Company: company1)
testcompanylist.addCompany(Company: company2)
testcompanylist.addCompany(Company: company3)
testcompanylist.addCompany(Company: company4)
testcompanylist.toString()
print("-------------------update Company-----------")
testcompanylist.UpdateCompany(id: 4, symbol: "FBupdated", headquarter: "Menlo Park,CA updated", email: nil)
testcompanylist.toString()
print("--------------------Delete Company-----------")
testcompanylist.DeleteCompany(id: 4)
testcompanylist.toString()
