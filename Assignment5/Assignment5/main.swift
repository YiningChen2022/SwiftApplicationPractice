//
//  main.swift
//  Assignment5
//
//  Created by Yining Chen on 10/20/21.
//

import Foundation

//add company
let testcompanylist = CompanyDirecrtory(companyList: Array())

var company1 = Company(name: "Google", symbol: "GOOGL", headquarter: "Mountain View", email: "google@gmail.com")
var company2 = Company(name: "Apple", symbol: "AAPL", headquarter: "Mountain View", email: "apple@apple.com")
var company3 = Company(name: "Amazon", symbol: "AMZN", headquarter: "seattle ", email: "amazon@amazon.com")
var company4 = Company(name: "FaceBook", symbol: "FB", headquarter: "Menlo Park,CA", email: "facebook@facebook.com")
testcompanylist.addCompany(Company: company1)
testcompanylist.addCompany(Company: company2)
testcompanylist.addCompany(Company: company3)
testcompanylist.addCompany(Company: company4)



//add customer
let testcustomerlist = CustomerDirecrtory(customerList: Array())

var customer1 = Customer(firstName: "James", lastName: "James", address: "123 st", contactDetails: "618-111-1111", emailID: "James@gmail.com")
var customer2 = Customer(firstName: "Robert", lastName: "Robert", address: "234 st", contactDetails: "618-222-2222", emailID: "Robert@gmail.com")
var customer3 = Customer(firstName: "Mary", lastName: "Mary", address: "345 st", contactDetails: "618-333-3333", emailID: "mary@gmail.com")
var customer4 = Customer(firstName: "Patricia", lastName: "Patricia", address: "456 st", contactDetails: "618-444-4444", emailID: "Patricia@gmail.com")

testcustomerlist.addCustomer(Customer: customer1)
testcustomerlist.addCustomer(Customer: customer2)
testcustomerlist.addCustomer(Customer: customer3)
testcustomerlist.addCustomer(Customer: customer4)



//add category
let testCategorylist = CategoryDirecrtory(catagoryList: Array())

var category1=Category(name: "Class C")
var category2=Category(name: "Technology")
var category3=Category(name: "Consumer Services")
var category4=Category(name: "Utilities")
testCategorylist.addCategory(Category: category1)
testCategorylist.addCategory(Category: category2)
testCategorylist.addCategory(Category: category3)
testCategorylist.addCategory(Category: category4)




//add stock
let teststocklist = StockDirecrtory(stockList: Array())

var stock1=Stock(name: "AAPL", lastTradePrice: 149.06, financialRating: 9, category: category2, company: company2)
var stock2=Stock(name: "GOOGL", lastTradePrice:2740.44, financialRating: 8, category: category1, company: company1)
var stock3=Stock(name: "AMAZ", lastTradePrice: 3355.67, financialRating: 7, category: category3, company: company3)
teststocklist.addStock(Stock: stock1)
teststocklist.addStock(Stock: stock2)
teststocklist.addStock(Stock: stock3)


teststocklist.searchByName(name: "AAPL")
print("--------------------searchByFinancialRating >= 8--------------")
teststocklist.searchByFinancialRating(financialRating: 8)
print("--------------------searchByLastTradePrice>=1000--------------")
teststocklist.searchByLastTradePrice(lastTradePrice:1000.00)


print("Select options  :")
print("1.manage customer")
print("2.mamage company")
print("3.manage category")
print("4.manage stock")
let selected : String? = readLine()
switch selected!{
case "1"://manage customer
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
case "2"://mamage company
    print("Select options :")
    print("1.add company")
    print("2.update company")
    print("3.Delete company")
    print("4.View All company")

    let selected : String? = readLine()
    switch selected!{
    case "1":
        print("Enter company Name: ")
        let name : String? = readLine()
        print("Enter company Symbol: ")
        let symbol : String? = readLine()
        print("Enter  company Headquarter: ")
        let headquarter: String? = readLine()
        print("Enter  company email: ")
        let email : String? = readLine()
       
        if (name != "" && symbol != "" && headquarter != "" && email != "" ){
            let company5=Company(name: name!, symbol: symbol!, headquarter: headquarter!, email: email!)
            testcompanylist.addCompany(Company: company5)
            print("--------------------company added---------------")
            testcompanylist.toString()
        }else{
            print("input invalied")
        }
    case "2":
        testcompanylist.toString()
        print("Select company id:")
        let  companyid: String? = readLine()
        if companyid != nil && companyid != ""{
            let  companyid1 = Int(companyid!)
            let curr=testcompanylist.getCompany(id:companyid1!)
            if curr != nil {
                print("updated Symbol: (enter empty to skip)")
                let updateSymbol : String? = readLine()
                print("updated Headquarter: (enter empty to skip)")
                let updateHeadquarter : String? = readLine()
                print("updated Email: (enter empty to skip)")
                let updateEmail : String? = readLine()
                testcompanylist.UpdateCompany(id: curr!.id, symbol:updateSymbol! , headquarter: updateHeadquarter!, email: updateEmail!)
                print("--------------------Company updated ---------------")
                 testcompanylist.toString()
            }else{
                print("user Not founded")
            }
        }else {
            print("Invalid input")
        }
    case "3":
        testcompanylist.toString()
        print("Select company id to delete:")
        let  companyid: String? = readLine()
        if companyid != nil && companyid != ""{
            let  companyid1 = Int(companyid!)
            let curr=testcompanylist.getCompany(id: companyid1!)
            if curr != nil {
                testcompanylist.DeleteCompany(id: curr!.id)
                print("--------------------company Deleted ---------------")
                 testcompanylist.toString()
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
    
case "3"://manage category
    print("Select options :")
    print("1.add  category")
    print("2.update  category")
    print("3.Delete  category")
    print("4.View All  category")

    let selected : String? = readLine()
    switch selected!{
    case "1":
        print("Enter  category Name: ")
        let name : String? = readLine()

       
        if (name != "" ){
            let category5 = Category(name: name!)
            testCategorylist.addCategory(Category: category5)
     
            print("--------------------Category added---------------")
            testCategorylist.toString()
        }else{
            print("input invalied")
        }
    case "2":
        testCategorylist.toString()
        print("Select Category id:")
        let  categoryid: String? = readLine()
        if categoryid != nil && categoryid != ""{
            let  categoryid1 = Int(categoryid!)
            let curr = testCategorylist.getCategory(id: categoryid1!)
            if curr != nil {
                print("updated Name")
                let name : String? = readLine()
                      testCategorylist.UpdateCategory(id: curr!.id, name: name!)

                print("--------------------Category updated ---------------")
                 testCategorylist.toString()
            }else{
                print("user Not founded")
            }
        }else {
            print("Invalid input")
        }
    case "3":
        testCategorylist.toString()
        print("Select Category id to delete:")
        let  Categoryid: String? = readLine()
        if Categoryid != nil && Categoryid != ""{
            let  Categoryid1 = Int(Categoryid!)
            let curr=testCategorylist.getCategory(id: Categoryid1!)
            if curr != nil {
                testCategorylist.DeleteCategory(id: curr!.id)
                print("--------------------Category Deleted ---------------")
                testCategorylist.toString()
            }else{
                print("user Not founded")
            }
        }else {
            print("Invalid input")
        }
        
    case "4":
        testCategorylist.toString()
    default:
        print("input invalid")
    }
    
case "4":
    print("Select options :")
    print("1.add  stocks")
    print("2.update  stocks")
    print("3.Delete  stocks")
    print("4.View All  stocks")

    let selected : String? = readLine()
    switch selected!{
    case "1":
        print("Enter stock Name: ")
        let name : String? = readLine()
        print("Enter stock Comapny: ")
        testcompanylist.toString()
        let currentcompanyid : String? = readLine()
        print("Enter last Trade Price")
        let lastTradePrice : String? = readLine()
        print("Enter Financial Rating")
        let FinancialRating : String? = readLine()
        print("Select  stock Category: ")
        testCategorylist.toString()
        let currentcategoryid : String? = readLine()
         if (name != "" && lastTradePrice != "" && FinancialRating != ""  && currentcompanyid != "" && currentcategoryid != "" &&   Int(currentcategoryid!) != nil && Int(currentcompanyid!) != nil && Int(FinancialRating!)  != nil && Double(lastTradePrice!) != nil ){
             
             let currcompany=testcompanylist.getCompany(id:Int(currentcompanyid!)!)
             let currcategory=testCategorylist.getCategory(id:Int(currentcategoryid!)!)
             if (currcompany != nil && currcategory != nil && Int(FinancialRating!)! <= 10 &&  Int(FinancialRating!)!>=1){
                 let stock5 = Stock(name: name!, lastTradePrice: Double(lastTradePrice!)!, financialRating: Int(FinancialRating!)!, category:currcategory! , company: currcompany!)
                 teststocklist.addStock(Stock: stock5)
                 print("--------------------Stock added---------------")
                 teststocklist.toString()
             }else{
                 print("invalid input")
             }
        }else{
            print("input invalied")
        }
    case "2":
        teststocklist.toString()
        print("Select stock id:")
        let  stockid: String? = readLine()
        if stockid != nil && stockid != ""{
            let curr = teststocklist.getStock(id:Int(stockid!)!)
            if curr != nil {
                print("updated Company id ->enter empty to skip")
                testcompanylist.toString()
                let Companyid : String? = readLine()
                print("updated LastTradePrice->enter empty to skip")
                let lasttradeprice: String? = readLine()
                print("updated Financial Rating->enter empty to skip")
                let financialRating : String? = readLine()
                print("updated Catagory->enter empty to skip")
                testCategorylist.toString()
                let Categoryid : String? = readLine()
                let currcompany:Company?
                let currcategory: Category?
              //  if (Int(Companyid!) != nil  ){
                    currcompany=testcompanylist.getCompany(id:Int(Companyid!)!)
               // } else if (Int(Categoryid!) != nil ){
                    currcategory=testCategorylist.getCategory(id:Int(Categoryid!)!)
                //}
                teststocklist.UpdateStock(id: curr!.id, company: currcompany , lastTradePrice: Double(lasttradeprice!), financialRating: Int(financialRating!), Category: currcategory)
                print("--------------------stock updated ---------------")
                 teststocklist.toString()
            }
        }else{
            print("stock not found")
        }
           
    case "3":
        teststocklist.toString()
        print("Select stock id to delete:")
        let  stockid: String? = readLine()
        if stockid != nil && stockid != ""{
            let curr=teststocklist.getStock(id: Int(stockid!)!)
            if curr != nil {
                teststocklist.DeleteStock(id: curr!.id)
                print("--------------------srock Deleted ---------------")
                teststocklist.toString()
            }else{
                print("user Not founded")
            }
        }else {
            print("Invalid input")
        }
        
    case "4":
        teststocklist.toString()
        print("Select options :")
        print("1.Search by Company")
        print("2.Search by Category")
        print("3.search by Name")
        print("4.search by financial Rating ")
        print("5.search by Last trade price ")
        let selected : String? = readLine()
        switch selected!{
        case "1":
            print("Select company id:")
            testcompanylist.toString()
            let companyid : String? = readLine()
            teststocklist.searchByCompany(Companyid: Int(companyid!)!)
        case "2":
            print("Select category id:")
            testCategorylist.toString()
            let categoryid : String? = readLine()
            teststocklist.searchByCategory(categoryid: Int(categoryid!)!)
            
        case "3":
            print("Select Name:")
            teststocklist.toString()
            let stockName : String? = readLine()
            teststocklist.searchByName(name: stockName!)
            
        case "4":
            print("input financial rating minimum:")
            let financialrating : String? = readLine()
            teststocklist.searchByFinancialRating(financialRating: Int(financialrating!)!)
            
        case "5":
            print("input last trade in price minimum :")
            let last : String? = readLine()
            teststocklist.searchByLastTradePrice(lastTradePrice: Double(last!)!)
        default:
            print("input invalid")
        }
        
    default:
        print("input invalid")
    }
    
default:
    print("input invalid")

}

    

