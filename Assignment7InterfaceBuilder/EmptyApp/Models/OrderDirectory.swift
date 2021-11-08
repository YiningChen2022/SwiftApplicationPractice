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
                let price=value.stock.getlastTradePrice()
                let quant = Double(value.quantity)
                value.customer.setTotalInvestment(investment: -price*quant)
                orderList.remove(at: index)
            }
            
        }
    }

    public func totalStockQuantityforCustomer(customer: Customer,stock: Stock)->Int{
        var quantity=0
        for order in orderList {
            if (order.getCustomer().getid()==customer.id && order.stock.id==stock.id){
                quantity+=order.quantity
            }
                
        }
        return quantity
    }
    public func avgforCustomer(customer: Customer,stock: Stock)->Double{
        var quantity=0
        var totalprice=0.0
        for order in orderList {
            if (order.getCustomer().getid()==customer.id && order.stock.id==stock.id){
                totalprice+=order.getinvestedmoney()
                print( totalprice)
                quantity+=order.quantity
            }
        }
        return totalprice/Double(quantity)
    }
    


    


    
    
    public func toString(customer: Customer)->Array<String>{
        var str:Array<String>=[]
        for order in orderList {
            if (order.getCustomer().getid()==customer.id){
            str.append(order.toString())
            }
                
        }
        return str
        
    }
    public func toStringStock(customer: Customer)->Array<String>{
        var str:Array<String>=[]
        var res:Array<String>=[]
        for order in orderList {
            if (order.getCustomer().getid()==customer.id){
                str.append(order.getStock().toStringShort())
            }
        }
        for s in str {
            if !res.contains(s){
                res.append(s)
            }
        }
        return res
        
    }
    public func toString()->Array<String>{
        var str:Array<String>=[]
   
        for order in orderList {
           
            str.append(order.stock.toString())
        }
        
        return str
    }
    
    public func getsize (customer: Customer)->Int{
        var count=0;
    
        for order in orderList{
            if  order.getCustomer().id==customer.id{
                count+=1;
            }
        }
        return count
    }
    
    
    public func getsizeofStock (customer: Customer)->Int{
        var str:Array<String>=[]
        var res:Array<String>=[]
        for order in orderList {
            if (order.getCustomer().getid()==customer.id){
                str.append(order.getStock().toStringShort())
            }
        }
        for s in str {
            if !res.contains(s){
                res.append(s)
            }
        }
        return res.count
    }
   
}
