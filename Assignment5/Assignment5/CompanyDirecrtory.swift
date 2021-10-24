//
//  CompanyDirecrtory.swift
//  Assignment5
//
//  Created by Yining Chen on 10/24/21.
//

import Foundation
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
    public func getCompany(id:Int)->Company?{
        var curr: Company?
        for (_, value) in companyList.enumerated() {
            if value.id==id {
                curr=value
            }
        }
       return curr
    }
    public func UpdateCompany (id:Int,symbol:String?, headquarter: String?, email:String?){
       
             for (index, value) in companyList.enumerated() {
                 if value.id==id {
                     if symbol != nil && symbol != "" {
                         value.setSymbol(symbol: symbol!)
                     }
                     if  headquarter != nil && headquarter != ""{
                         value.setHeadquarter(headquarter: headquarter!)
                     }
                     if  email != nil &&  email != ""{
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

