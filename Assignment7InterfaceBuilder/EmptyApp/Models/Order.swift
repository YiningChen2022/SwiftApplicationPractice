//
//  Order.swift
//  EmptyApp
//
//  Created by Yining Chen on 11/4/21.
//  Copyright © 2021 rab. All rights reserved.
//

import Foundation
class Order{
    static var nextUid:Int = 0
    static func generateUid() -> Int {
         nextUid+=1
        return nextUid
    }
    var  orderid: Int
    var  stock: Stock
    var  quantity: Int
    var  date:Date
    var invested: Bool
    var  customer: Customer
    var tradeinPrice: Double
    init(stock: Stock,quantity: Int,invested: Bool,customer: Customer, tradeinPrice:Double) {
        self.orderid=Order.generateUid()
        self.stock=stock
        self.quantity = quantity
        self.date=Date()
        self.customer=customer
        self.invested=invested
        self.tradeinPrice=tradeinPrice
   
    }
    public func getorderId()->Int {
        return orderid
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
   
    public func getInvested()->Bool {
        return invested
    }
    public func setInvested(Invested:Bool){
        self.invested=Invested
    }
    public func getStock()->Stock {
        return stock
    }
    public func setStock(stock:Stock){
        self.stock=stock
    }
    public func getinvestedmoney()->  Double{
        return  Double(quantity)*tradeinPrice
    }
    
    
    public func toString ()->String{
        return "\(orderid) \(stock.getName()) Qty:\(quantity) \(date)"
    }
}
