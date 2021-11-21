//
//  Order.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/11/21.
//

import Foundation
class Order{
    static var nextUid:Int = 0
    static func generateUid() -> Int {
         nextUid+=1
        return nextUid
    }
    var  orderid: Int
    var  stock: Array<Stock>
    var  quantity: Array<Int>
    var  date:Date
    var invested: Bool
    var  customer: Customer
    var tradeinPrice: Array<Double>
    init(stock: Array<Stock>,quantity: Array<Int>,invested: Bool,customer: Customer, tradeinPrice:Array<Double>) {
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
    public func getQuantity()->Array<Int>{
        return quantity
    }
    public func setQuantity(quantity :Array<Int>){
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
        //formatter.timeStyle = .medium
        formatter.dateStyle = .long
        
        return formatter.string(from:self.date)
    }
    public func setDate(date: Date){
        self.date=date
    }
   
    public func getInvested()->Bool {
        return invested
    }
    public func setInvested(Invested:Bool){
        self.invested=Invested
    }
    public func getStock()->Array<Stock> {
        return stock
    }
    public func setStock(stock:Array<Stock>){
        self.stock=stock
    }
    public func getinvestedmoney(stock:Stock)->  Double{
        var res=0.0
        for i in 0..<quantity.count {
            if self.stock[i].id==stock.id{
               res = Double(quantity[i])*tradeinPrice[i]
            }
            
        }
    
        return res
    }
    
    public func StocktoString(Stocks:Array<Stock>)->  String{
        var str=""
        
        for stock in Stocks{
            let components = stock.toStringShort().components(separatedBy: " ")
            str+=components[1]+","
        }
        return str
    }
    public func QualitytoString(quant:Array<Int>)->  String{
        var str=""
        
        for q in quant{
    
            str+=String(q)+","
        }
        return str
    }
    
    
    public func toString ()->String{
        return "\(orderid) \(StocktoString(Stocks: stock)) \(QualitytoString(quant:quantity)) \(date)"
    }
}

