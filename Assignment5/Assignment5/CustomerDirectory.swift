//
//  CustomerDirectory.swift
//  Assignment5
//
//  Created by Yining Chen on 10/24/21.
//

import Foundation
class CustomerDirecrtory {
    public var customerList: [Customer]
    init(customerList:Array<Customer>){
        self.customerList = []
    }
    public static func listofCustomer()->Array<Customer>{
        
        var customer1 = Customer(firstName: "James", lastName: "James", address: "123 st", contactDetails: "618-111-1111", emailID: "James@gmail.com")
        var customer2 = Customer(firstName: "Robert", lastName: "Robert", address: "234 st", contactDetails: "618-222-2222", emailID: "Robert@gmail.com")
        var customer3 = Customer(firstName: "Mary", lastName: "Mary", address: "345 st", contactDetails: "618-333-3333", emailID: "mary@gmail.com")
        var customer4 = Customer(firstName: "Patricia", lastName: "Patricia", address: "456 st", contactDetails: "618-444-4444", emailID: "Patricia@gmail.com")
        customerlist.append(customer1)
        
       
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
    public func getsize ()->Int{
        var count=0;
        for _ in customerList{
            count+=1;
        }
        return count
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
    public func toString()->Array<String>{
        var str:Array<String>=[]
        for customer in customerList {
            str.append(customer.toString())
        }
        return str
        
    }
}
