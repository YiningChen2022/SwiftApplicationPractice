//
//  Category.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/11/21.
//

import Foundation
class Category{
    static var nextUid:Int = 0
    static func generateUid() -> Int {
         nextUid+=1
        return nextUid
    }
    var id:Int
    var name: String
    init(name: String){
        self.id=Category.generateUid()
        self.name=name
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
    public func toString ()->String{
        return "\(id) \(name)"
    }
}

