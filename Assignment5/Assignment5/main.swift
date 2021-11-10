//
//  main.swift
//  Assignment5
//
//  Created by Yining Chen on 10/20/21.
//

import Foundation

var end = false
//add company list
let testcompanylist = CompanyDirecrtory(companyList: Array())
//add customer list
let testcustomerlist = CustomerDirecrtory(customerList: Array())
//add category list
let testCategorylist = CategoryDirecrtory(catagoryList: Array())
//add stock list
let teststocklist = StockDirecrtory(stockList: Array())


while !end{
    print("Select options  :")
    print("1.manage customer")
    print("2.mamage company")
    print("3.manage category")
    print("4.manage stock")
    print ("5.break")
    let selected : String? = readLine()
    switch selected!{
    case "1":
        managerCustomer()
    case "2":
        manageCompany()
    case "3":
        manageCategory()
    case "4":
        managestock()
    case "5":
        end=true
    default:
        print("invalid input")
        
    }
}
