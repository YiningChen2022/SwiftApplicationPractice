//
//  OrderDirectory.swift
//  EmptyApp
//
//  Created by Yining Chen on 11/4/21.
//  Copyright © 2021 rab. All rights reserved.
//

import Foundation
class OrderDirecrtory {
    var orderList: [Order]
    init(orderList:Array<Order>){
        self.orderList = []
    }
    public func addOrder(Order:Order){
        orderList.append(Order)
    }
    public func getOrder(id:Int)->Order?{
        var curr: Order?
        for (_, value) in orderList.enumerated() {
            if value.orderid==id {
                curr=value
            }
        }
       return curr
    }
    
    public func DeleteOrder(id:Int){
        for (index, value) in orderList.enumerated() {
            if value.orderid==id {
                orderList.remove(at: index)
            }
            
        }
    }
 
    
   
    public func toString()->Array<String>{
        var str:Array<String>=[]
        for order in orderList {
            str.append(order.toString())
        }
        return str
        
    }
   
}
