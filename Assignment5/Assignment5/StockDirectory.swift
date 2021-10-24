//
//  StockDirectory.swift
//  Assignment5
//
//  Created by Yining Chen on 10/24/21.
//

import Foundation


class StockDirecrtory {
    var stockList: [Stock]
    init(stockList:Array<Stock>){
        self.stockList = []
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
    public func searchByCompany(CompanyName:String){
        for   stock in stockList {
            if stock.company.getName() == CompanyName{
                print(stock.toString())
            }
        }

    }
    public func searchByCategory(categoryName: String){
        if categoryName == "" {
            print("please input valid value")
        }else{
            for   stock in stockList {
                if stock.category.getName() == categoryName{
                    print(stock.toString())
                }
            }
        }
     
    }
    public func searchByName(name: String){
        if name == "" {
            print("please input valid value")
        }else{
            for   stock in stockList {
                if stock.getName() == name{
                    print(stock.toString())
                }
            }
            
        }
    }
    public func searchByFinancialRating(financialRating: Int){
        if financialRating>10 || financialRating<0 {
            print("please input valid value")
        }else{
            for   stock in stockList {
                if stock.getfinancialRating() >= financialRating{
                    print(stock.toString())
                }
            }
       
        }
    }
    public func searchByLastTradePrice(lastTradePrice: Double){
        if lastTradePrice<0.00 {
            print("please input valid value")
        }else{
            for   stock in stockList {
                if stock.getlastTradePrice() >= lastTradePrice{
                    print(stock.toString())
                }
            }
        }
    }

}
