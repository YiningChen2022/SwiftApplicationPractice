//
//  SearchStock.swift
//  Assignment5
//
//  Created by Yining Chen on 11/10/21.
//

import Foundation


public func searchstock(){
    var end=false
    while(!end){
        print("Select options :")
        print("1.Search by Company")
        print("2.Search by Category")
        print("3.search by Name")
        print("4.search by financial Rating ")
        print("5.search by Last trade price ")
        print("6. Go To Upper Level")
        let selected : String? = readLine()
        switch selected!{
        case "1":
            print("Select company id:")
            testcompanylist.toString()
            let companyid : String? = readLine()
            if companyid != "" {
                teststocklist.searchByCompany(Companyid: Int(companyid!)!)
            }
           
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
        case "6":
            end=true
        default:
            print("input invalid")
        }
        
        
        
        
    }
}
