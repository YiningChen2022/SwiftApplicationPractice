//
//  ManagerCustomer.swift
//  EmptyApp
//
//  Created by Yining Chen on 10/28/21.
//  Copyright © 2021 rab. All rights reserved.
//

import Foundation
final class CustomerManager{
    let testcustomerlist = CustomerDirecrtory(customerList: Array())
    
    
    public func signup(){
        let customer1 = Customer(firstName: "James", lastName: "James", address: "123 st", contactDetails: "618-111-1111", emailID: "James@gmail.com")
        let customer2 = Customer(firstName: "Robert", lastName: "Robert", address: "234 st", contactDetails: "618-222-2222", emailID: "Robert@gmail.com")
        let customer3 = Customer(firstName: "Mary", lastName: "Mary", address: "345 st", contactDetails: "618-333-3333", emailID: "mary@gmail.com")
        let customer4 = Customer(firstName: "Patricia", lastName: "Patricia", address: "456 st", contactDetails: "618-444-4444", emailID: "Patricia@gmail.com")
        testcustomerlist.addCustomer(Customer: customer1)
        testcustomerlist.addCustomer(Customer: customer2)
        testcustomerlist.addCustomer(Customer: customer3)
        testcustomerlist.addCustomer(Customer: customer4)
    }
}
