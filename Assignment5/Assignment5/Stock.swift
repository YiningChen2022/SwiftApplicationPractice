//
//  Stock.swift
//  Assignment5
//
//  Created by Yining Chen on 10/24/21.
//

import Foundation


class Stock{
    static var nextUid:Int = 0
    static func generateUid() -> Int {
         nextUid+=1
        return nextUid
    }
    var  id: Int
    var  name : String
    var  company: Company
    var  lastTradePrice: Double
    var  financialRating: Int
    var  category: Category
    init(name : String,lastTradePrice: Double ,financialRating: Int ,category: Category,company:Company) {
        self.category=category
        self.id=Stock.generateUid()
        self.name=name
        self.lastTradePrice=lastTradePrice
        self.financialRating=financialRating
        self.company=company
    }
    public func getId()->Int {
        return id
    }
    public func getName()->String {
        return name
    }
    public func setName(name :String){
        self.name=name
    }
    public func getCompany()->Company {
        return company
    }
    public func setCompany(company :Company){
        self.company=company
    }
    public func getlastTradePrice()->Double {
        return  lastTradePrice
    }
    public func setlastTradePrice(lastTradePrice :Double){
        self.lastTradePrice=lastTradePrice
    }
    public func getfinancialRating()->Int {
        return financialRating
    }
    public func setfinancialRating(financialRating:Int){
        self.financialRating=financialRating
    }
    public func getCategory()->Category {
        return category
    }
    public func setCategory(category:Category){
        self.category=category
    }
    
    
    public func toString ()->String{
        return "\(id) \(name) Company: \(company.toString())  LastTrade:\(lastTradePrice) financial: \(financialRating) Cate:\(category.toString()) "
    }
}
