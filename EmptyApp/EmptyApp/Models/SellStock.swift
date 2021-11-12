//
//  SellStock.swift
//  EmptyApp
//
//  Created by Yining Chen on 11/11/21.
//  Copyright © 2021 rab. All rights reserved.
//

import Foundation
class SellStock{
    static var nextUid:Int = 0
    static func generateUid() -> Int {
         nextUid+=1
        return nextUid
    }
    var  id: Int
    var  stock: Stock
    var  quantity: Int
    var  date:Date
    var  customer: Customer
    var Earning: Double
    var Company: Company
    init(stock: Stock,quantity: Int,customer: Customer, Earning:Double, Company:Company) {
        self.id=Order.generateUid()
        self.stock=stock
        self.quantity = quantity
        self.date=Date()
        self.customer=customer
        self.Company=Company
        self.Earning=Earning
        
   
    }
    public func getId()->Int {
        return  id
    }
    public func getQuantity()->Int{
        return quantity
    }
    public func setQuantity(quantity :Int){
        self.quantity=quantity
    }
    public func getCustomer()->Customer {
        return customer
    }
    public func setCustomer(customer:Customer){
        self.customer=customer
    }
    public func getDate()->String {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .long
        
        return formatter.string(from:self.date)
    }
   
    public func getEarning()->Double{
        return Earning
    }
    public func setEarning(Earning:Double){
        self.Earning=Earning
    }
    public func getStock()->Stock {
        return stock
    }
    public func setStock(stock:Stock){
        self.stock=stock
    }
    
    
    public func toString ()->String{
        return "Order Id\(id) \(stock.getName()) \(date) \(customer.getid()) \(Earning)"
    }
}
