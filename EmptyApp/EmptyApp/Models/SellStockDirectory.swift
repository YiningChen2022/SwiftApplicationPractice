//
//  SellStockDirectory.swift
//  EmptyApp
//
//  Created by Yining Chen on 11/11/21.
//  Copyright © 2021 rab. All rights reserved.
//

import Foundation
class SellStockDirecrtory {
    var sellStockList: [SellStock]
    init(sellStockList:Array<SellStock>){
        self.sellStockList = []
    }
    public func addSellStock(SellStock:SellStock){
        sellStockList.append(SellStock)
    }
    public func getSellStock(id:Int)->SellStock?{
        var curr: SellStock?
        for (_, value) in sellStockList.enumerated() {
            if value.id==id {
                curr=value
            }
        }
       return curr
    }
    
    public func DeleteSellStock(id:Int){
        for (index, value) in sellStockList.enumerated() {
            if value.id==id {
                sellStockList.remove(at: index)
            }
            
        }
    }
 
    
    public func SellStockQuantityforCustomer(customer: Customer,stock: Stock)->Int{
        var quantity=0
        for sellstock in sellStockList {
            if (sellstock.getCustomer().getid()==customer.id && sellstock.stock.id==stock.id){
                quantity+=sellstock.quantity
            }
                
        }
        return quantity
    }
   
    public func toString()->Array<String>{
        var str:Array<String>=[]
        for SellStock in sellStockList {
            str.append(SellStock.toString())
        }
        return str
        
    }
   
}
