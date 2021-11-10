//
//  ManageCompany.swift
//  Assignment5
//
//  Created by Yining Chen on 11/10/21.
//

import Foundation
public func manageCompany() {
    var end = false
    while(!end){
    //mamage company
        print("Select options :")
        print("1.add company")
        print("2.update company")
        print("3.Delete company")
        print("4.View All company")
        print("5. Go to Upper Level")

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
            testcompanylist.toString()
        case "5":
            end=true
        default:
            print("input invalid")
        }
        
    }}
    
