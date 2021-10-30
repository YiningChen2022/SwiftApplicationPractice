//
//  Interview.swift
//  assignment4
//
//  Created by Yining Chen on 10/29/21.
//

import Foundation
class Interviewer{
    var name: String
    var uniqueId:UUID
    var salary:Int?=nil
    init(name: String, salary:Int?){
        self.name=name
        self.uniqueId=UUID()
        self.salary=salary
        
    }
    
    public func getName()->String{
        return name
    }
    public func getUniqueId()->UUID{
        return uniqueId
    }
    public func getsalary()->Int?{
        return salary
    }
    public func setName(name: String){
        self.name=name
    }
    public func setUniqueId(uniqueId: UUID){
        self.uniqueId=uniqueId
    }
    public func setSalary(salary: Int?){
        self.salary=salary
    }
    public func toString()->String {
        if self.salary==nil{
            return "Id: \(uniqueId) name:  \(name) Salary: default"
        }else{
            return "Id: \(uniqueId) name:  \(name) Salary \(salary!)"
        }
    }
}
