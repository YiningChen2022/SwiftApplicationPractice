//
//  Company.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/11/21.
//

import Foundation
import UIKit
class Company {
    static var nextUid:Int = 0
    static func generateUid() -> Int {
         nextUid+=1
        return nextUid
    }
    let id: Int
    var  name : String
    var  symbol : String
    var  headquarter: String
    var  email: String
    var logo: UIImage
    init(name : String,symbol : String,headquarter: String, email: String) {
        self.name=name
        self.symbol=symbol
        self.headquarter=headquarter
        self.email=email
        self.id=Company.generateUid()
        self.logo=UIImage(named:"fb.png")!
    }
    public func getid()->Int{
        return id
    }
    public func getName()->String {
        return name
    }
    public func setName(name :String){
        self.name=name
    }
    public func getSymbol()->String {
        return symbol
    }
    public func setSymbol(symbol:String){
        self.symbol=symbol
    }
    public func getHeadquarter()->String {
        return headquarter
    }
    public func setHeadquarter(headquarter:String){
        self.headquarter=headquarter
    }
    public func getEmail()->String {
        return email
    }
    public func setEmail(email :String){
        self.email=email
    }
    public func getLogo()->UIImage{
        return logo
        
    }
   
    public func setLogo(Logo: UIImage){
        self.logo=Logo
    }
    public func toString ()->String{
        return "\(id) \(name) \(symbol) \(email) \(headquarter)"
    }
    public func toStringshort ()->String{
        return "\(id) \(name)"
    }
}
