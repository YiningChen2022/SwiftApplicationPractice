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

}
