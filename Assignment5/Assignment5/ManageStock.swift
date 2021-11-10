//
//  ManageStock.swift
//  Assignment5
//
//  Created by Yining Chen on 11/10/21.
//

import Foundation
public func managestock (){
    var end=false
    while(!end){
        print("Select options :")
        print("1.add  stocks")
        print("2.update  stocks")
        print("3.Delete  stocks")
        print("4.View All  stocks")
        print("5. Go To Upper Level")

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
                print("stock Id not found")
            }
            
        case "4":
            searchstock()
        case "5":
            end=true
        default:
            print("invalid input")
            
        }
    }

}
