//
//  CompanyDirectory.swift
//  EmptyApp
//
//  Created by Yining Chen on 11/11/21.
//  Copyright © 2021 rab. All rights reserved.
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
    
    public func getsize ()->Int{
        var count=0;
        for _ in companyList{
            count+=1;
        }
        return count
    }
    
    public func toString()->Array<String>{
        var str:Array<String>=[]
        for company in companyList {
            str.append(company.toString())
        }
        return str
        
    }
    public func toString(){
        for company in companyList {
            print (company.toString())
        }
    }
}

