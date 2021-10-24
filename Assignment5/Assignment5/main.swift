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
        if  symbol == "" || headquarter == "" || email == ""{
            print("invalid input ")
        }else{
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
    public func getCustomer(id:Int)->Customer?{
        var curr: Customer?
        for (_, value) in customerList.enumerated() {
            if value.id==id {
                curr=value
            }
        }
       return curr
    }
    public func UpdateCustomer (id:Int,firstName: String?, lastName:String?, address:String?, contactDetails: String?, emailId:String?){
       
        for (index, value) in customerList.enumerated() {
            if value.id==id {
                if firstName != nil && firstName != "" {
                    value.setFirstName(firstName: firstName!)
                }
                if  lastName != nil && lastName != ""{
                    value.setLastName(lastName: lastName!)
                }
                if  address != nil && address != "" {
                    value.setAddress(address: address!)
                }
                if  contactDetails != nil && contactDetails != "" {
                    value.setContactDetails(contactDetails: contactDetails!)
                }
                if  emailId != nil && emailId != ""{
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

class CategoryDirecrtory {
    var catagoryList: [Category]
    init(catagoryList:Array<Category>){
        self.catagoryList = []
    }
    public func addCategory(Category:Category){
        catagoryList.append(Category)
    }
    
    public func DeleteCategory(id:Int){
        for (index, value) in catagoryList.enumerated() {
            if value.id==id {
                catagoryList.remove(at: index)
            }
            
        }
    }
    public func UpdateCategory (id:Int,name: String){
        if name == "" {
            print("please input name")
        }else {
        for (index, value) in catagoryList.enumerated() {
            if value.id==id {
                value.setName(name: name)
            }
            
        }
        }
    }
    public func toString(){
        for   catagory in catagoryList {
            print ( catagory.toString())
        }
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
    var  category: Category
    init(name : String,lastTradePrice: Double ,financialRating: Int ,category: Category,company:Company) {
        self.category=category
        self.id=Stock.generateUid()
        self.name=name
        self.lastTradePrice=lastTradePrice
        self.financialRating=financialRating
        self.company=company
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
    public func getCompany()->Company {
        return company
    }
    public func setCompany(company :Company){
        self.company=company
    }
    public func getlastTradePrice()->Double {
        return  lastTradePrice
    }
    public func setlastTradePrice(lastTradePrice :Double){
        self.lastTradePrice=lastTradePrice
    }
    public func getfinancialRating()->Int {
        return financialRating
    }
    public func setfinancialRating(financialRating:Int){
        self.financialRating=financialRating
    }
    public func getCategory()->Category {
        return category
    }
    public func setCategory(category:Category){
        self.category=category
    }
    
    
    public func toString ()->String{
        return "Stock:\(id) \(name) CompanyInfo: \(company.toString())  LastTradePrice:\(lastTradePrice) financialRating: \(financialRating) Category:\(category) "
    }
}
class StockDirecrtory {
    var stockList: [Stock]
    init(stockList:Array<Stock>){
        self.stockList = []
    }
    public func addStock(Stock:Stock){
        stockList.append(Stock)
    }
    
    public func DeleteStock(id:Int){
        for (index, value) in stockList.enumerated() {
            if value.id==id {
                stockList.remove(at: index)
            }
            
        }
    }
    public func UpdateStock (id:Int,company:Company?,lastTradePrice:Double?,financialRating:Int?, Category:Category?){
       
        for (index, value) in stockList.enumerated() {
            if value.id==id {
                if company != nil {
                    value.setCompany(company: company!)
                }
                if lastTradePrice != nil && lastTradePrice!>0.00 {
                    value.setlastTradePrice(lastTradePrice:lastTradePrice!)
                }
                if  financialRating != nil && financialRating!>0 && financialRating!<10  {
                    value.setfinancialRating(financialRating: financialRating!)
                }
                if  Category != nil {
                    value.setCategory(category: Category!)
                }
            }
        
        }
    }
    public func toString(){
        for   stock in stockList {
            print ( stock.toString())
        }
    }
    public func searchByCompany(CompanyName:String){
        for   stock in stockList {
            if stock.company.getName() == CompanyName{
                print(stock.toString())
            }
        }

    }
    public func searchByCategory(categoryName: String){
        if categoryName == "" {
            print("please input valid value")
        }else{
            for   stock in stockList {
                if stock.category.getName() == categoryName{
                    print(stock.toString())
                }
            }
        }
     
    }
    public func searchByName(name: String){
        if name == "" {
            print("please input valid value")
        }else{
            for   stock in stockList {
                if stock.getName() == name{
                    print(stock.toString())
                }
            }
            
        }
    }
    public func searchByFinancialRating(financialRating: Int){
        if financialRating>10 || financialRating<0 {
            print("please input valid value")
        }else{
            for   stock in stockList {
                if stock.getfinancialRating() >= financialRating{
                    print(stock.toString())
                }
            }
       
        }
    }
    public func searchByLastTradePrice(lastTradePrice: Double){
        if lastTradePrice<0.00 {
            print("please input valid value")
        }else{
            for   stock in stockList {
                if stock.getlastTradePrice() >= lastTradePrice{
                    print(stock.toString())
                }
            }
        }
    }

}

    
    


print("--------------------Testing Company------------------")
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


print("-----------------------------------------------------")

print("--------------------Testing Customer------------------")
let testcustomerlist = CustomerDirecrtory(customerList: Array())
print("--------------------Adding customers-----------")
var customer1 = Customer(firstName: "James", lastName: "James", address: "123 st", contactDetails: "618-111-1111", emailID: "James@gmail.com")
var customer2 = Customer(firstName: "Robert", lastName: "Robert", address: "234 st", contactDetails: "618-222-2222", emailID: "Robert@gmail.com")
var customer3 = Customer(firstName: "Mary", lastName: "Mary", address: "345 st", contactDetails: "618-333-3333", emailID: "mary@gmail.com")
var customer4 = Customer(firstName: "Patricia", lastName: "Patricia", address: "456 st", contactDetails: "618-444-4444", emailID: "Patricia@gmail.com")
print("--------------------view all customers-----------")
testcustomerlist.addCustomer(Customer: customer1)
testcustomerlist.addCustomer(Customer: customer2)
testcustomerlist.addCustomer(Customer: customer3)
testcustomerlist.addCustomer(Customer: customer4)



print("--------------------------------------------------")

print("--------------------Testing Categroy--------------")
let testCategorylist = CategoryDirecrtory(catagoryList: Array())
print("--------------------Adding Categroy---------------")
var category1=Category(name: "Class C")
var category2=Category(name: "Technology")
var category3=Category(name: "Consumer Services")
var category4=Category(name: "Utilities")
testCategorylist.addCategory(Category: category1)
testCategorylist.addCategory(Category: category2)
testCategorylist.addCategory(Category: category3)
testCategorylist.addCategory(Category: category4)

print("--------------------view all Categroy-----------")
testCategorylist.toString()
print("-------------------Categroy update--------------")
testCategorylist.UpdateCategory(id: 1, name: "energy")
testCategorylist.toString()
print("--------------------Delete Categroy--------------")
testCategorylist.DeleteCategory(id: 1)
testCategorylist.toString()



print("--------------------------------------------------")

print("--------------------Testing stock--------------")
let teststocklist = StockDirecrtory(stockList: Array())
print("--------------------Adding stock---------------")
var stock1=Stock(name: "AAPL", lastTradePrice: 149.06, financialRating: 9, category: category2, company: company2)
var stock2=Stock(name: "GOOGL", lastTradePrice:2740.44, financialRating: 8, category: category1, company: company1)
var stock3=Stock(name: "AMAZ", lastTradePrice: 3355.67, financialRating: 7, category: category3, company: company3)
teststocklist.addStock(Stock: stock1)
teststocklist.addStock(Stock: stock2)
teststocklist.addStock(Stock: stock3)
print("--------------------view allstock-----------")
teststocklist.toString()
print("-------------------stock update--------------")
teststocklist.UpdateStock(id: 1, company: nil, lastTradePrice: 160.00, financialRating: nil, Category: nil)
teststocklist.toString()

print("--------------------searchByCategory: Consumer Services--------------")
teststocklist.searchByCategory(categoryName: "Consumer Services")
print("--------------------searchByName:AAPL --------------")
teststocklist.searchByName(name: "AAPL")
print("--------------------searchByFinancialRating >= 8--------------")
teststocklist.searchByFinancialRating(financialRating: 8)
print("--------------------searchByLastTradePrice>=1000--------------")
teststocklist.searchByLastTradePrice(lastTradePrice:1000.00)

print("--------------------Delete stock--------------")
teststocklist.DeleteStock(id: 1)
teststocklist.toString()


print("Select options  :")
print("1.manage customer")
print("2.mamage company")
print("3.manage category")
print("4.manage stock")
let selected : String? = readLine()
switch selected!{
case "1":
    print("Select options :")
    print("1.add coustomer")
    print("2.update customer")
    print("3.Delete Customer")
    print("4.View All Customer")

    let selected : String? = readLine()
    switch selected!{
    case "1":
        print("Enter Customer first Name: ")
        let firstName : String? = readLine()
        print("Enter Customer Last Name: ")
        let lastName : String? = readLine()
        print("Enter Customer Address: ")
        let Address : String? = readLine()
        print("Enter Customer Contact details: ")
        let Contactdetails : String? = readLine()
        print("Enter Customer Email: ")
        let email: String? = readLine()
        if (firstName != "" && lastName != "" && Address != "" && Contactdetails != "" && email != ""){
            let customer5 = Customer(firstName: firstName!, lastName: lastName!, address: Address!, contactDetails: Contactdetails!, emailID: email!)
            testcustomerlist.addCustomer(Customer: customer5)
            print("--------------------customer added---------------")
             testcustomerlist.toString()
        }else{
            print("input invalied")
        }
    case "2":
        testcustomerlist.toString()
        print("Select customer id:")
        let  customerid: String? = readLine()
        if customerid != nil && customerid != ""{
            let  customerid1 = Int(customerid!)
            let curr=testcustomerlist.getCustomer(id: customerid1!)
            if curr != nil {
                print("updated First Name: (enter empty to skip)")
                let updatefirst : String? = readLine()
                print("updated Last Name: (enter empty to skip)")
                let updateLast : String? = readLine()
                print("updated Address: (enter empty to skip)")
                let updateAddress : String? = readLine()
                print("updated Contact Detail: (enter empty to skip)")
                let updateContactDetail : String? = readLine()
                print("updated EmailId: (enter empty to skip)")
                let updateEmailId : String? = readLine()
                testcustomerlist.UpdateCustomer(id: curr!.id, firstName: updatefirst, lastName: updateLast, address: updateAddress, contactDetails: updateContactDetail, emailId: updateEmailId)
                print("--------------------customer updated ---------------")
                 testcustomerlist.toString()
            }else{
                print("user Not founded")
            }
        }else {
            print("Invalid input")
        }
    case "3":
        testcustomerlist.toString()
        print("Select customer id to delete:")
        let  customerid: String? = readLine()
        if customerid != nil && customerid != ""{
            let  customerid1 = Int(customerid!)
            let curr=testcustomerlist.getCustomer(id: customerid1!)
            if curr != nil {
                testcustomerlist.DeleteCustomer(id: curr!.id)
                print("--------------------customer Deleted ---------------")
                 testcustomerlist.toString()
            }else{
                print("user Not founded")
            }
        }else {
            print("Invalid input")
        }
        
    case "4":
        testcustomerlist.toString()
    default:
        print("input invalid")
    }
case "2":
case "3":
case "4":

degau



    

