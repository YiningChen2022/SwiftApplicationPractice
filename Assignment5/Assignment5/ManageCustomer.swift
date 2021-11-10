//
//  ManageCustomer.swift
//  Assignment5
//
//  Created by Yining Chen on 11/10/21.
//

import Foundation

public func managerCustomer(){
var end=false
while(!end){
    //manage customer
    print("Select options :")
    print("1.add coustomer")
    print("2.update customer")
    print("3.Delete Customer")
    print("4.View All Customer")
    print("5.Go to Upper Level")
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
    case "5":
        end=true
    default:
        print("input invalid")
    }
}
}
