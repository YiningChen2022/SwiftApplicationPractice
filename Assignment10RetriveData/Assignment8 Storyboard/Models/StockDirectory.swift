//
//  StockDirectory.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/11/21.
//

import Foundation
class StockDirecrtory {
    var stockList: [Stock]
    init(stockList:Array<Stock>){
        self.stockList = []
    }
    public func getStock(id:Int)->Stock?{
        var curr: Stock?
        for (_, value) in stockList.enumerated() {
            if value.id==id {
                curr=value
            }
        }
       return curr
    }
    
    public func addStock(Stock:Stock){
        stockList.append(Stock)
    }
    
    public func DeleteStock(id:Int){
        for (index, value) in stockList.enumerated() {
            if value.id==id {
                stockList.remove(at: index)
            }
            
        }
    }
    public func getsize ()->Int{
        var count=0;
        for _ in stockList{
            count+=1;
        }
        return count
    }
    public func UpdateStock (id:Int,company:Company?,lastTradePrice:Double?,financialRating:Int?, Category:Category?){
       
        for (index, value) in stockList.enumerated() {
            if value.id==id {
                if company != nil {
                    value.setCompany(company: company!)
                }
                if lastTradePrice != nil && lastTradePrice!>0.00 {
                    value.setlastTradePrice(lastTradePrice:lastTradePrice!)
                }
                if  financialRating != nil && financialRating!>0 && financialRating!<10  {
                    value.setfinancialRating(financialRating: financialRating!)
                }
                if  Category != nil {
                    value.setCategory(category: Category!)
                }
            }
        
        }
    }
    public func toString(){
        for   stock in stockList {
            print ( stock.toString())
        }
    }
    
    public func toString()->Array<String>{
        var str:Array<String>=[]
        for stock in stockList {
            str.append(stock.toString())
        }
        return str
        
    }
    public func toStringShort()->Array<String>{
        var str:Array<String>=[]
        for stock in stockList {
            str.append(stock.toStringShort())
        }
        return str
        
    }
    public func searchByCompany(Companyid :Int)->Array<String>{
        var str:Array<String>=[]
        for   stock in stockList {
            if stock.company.getid() == Companyid{
                str.append(stock.toString())
            }
            
        }
        
        return str
    }
    public func searchCompanygetsize (Companyid :Int)->Int{
        var count=0;
        for stock in stockList{
            if stock.company.getid() == Companyid{
            count+=1;
                
            }
        }
        return count
    }
    public func searchCategorygetsize (categoryid: Int)->Int{
        var count=0;
        for stock in stockList{
            if stock.category.getId() == categoryid{
            count+=1;

            }
        }
        return count
    }
    public func searchByCategory(categoryid: Int)->Array<String>{
        var str:Array<String>=[]
            for   stock in stockList {
                if stock.category.getId() == categoryid{
                    str.append(stock.toString())
                }
        }
        return str
    }
    
    
    public func searchNamegetsize (name: String)->Int{
        var count=0;
        for stock in stockList{
            if stock.getName() == name{
            count+=1;

            }
        }
        return count
    }
    public func searchByName(name: String)->Array<String>{
        var str:Array<String>=[]
        if name == "" {
            print("please input valid value")
        }else{
            for   stock in stockList {
                if stock.getName() == name{
                    str.append(stock.toString())
                }
            }
        }
        return str
    }
    public func searchFinancialgetsize (financialRating: Int)->Int{
        var count=0;
        for stock in stockList{
            if stock.getfinancialRating() >= financialRating{
            count+=1;

            }
        }
        return count
    }
    public func searchByFinancialRating(financialRating: Int)->Array<String>{
        var str:Array<String>=[]
        if financialRating>10 || financialRating<0 {
            print("please input valid value")
        }else{
            for   stock in stockList {
                if stock.getfinancialRating() >= financialRating{
                    str.append(stock.toString())
                }
            }
        }
        return str
    }
    public func searchByLastTradePrice(lastTradePrice: Double)->Array<String>{
        var str:Array<String>=[]
        if lastTradePrice<0.00 {
            print("please input valid value")
        }else{
            for   stock in stockList {
                if stock.getlastTradePrice() >= lastTradePrice{
                    str.append(stock.toString())
                }
            }
        }
        return str
    }
    public func searchtradegetsize (lastTradePrice: Double)->Int{
        var count=0;
        for stock in stockList{
            if stock.getlastTradePrice() >= lastTradePrice{
            count+=1;

            }
        }
        return count
    }
}