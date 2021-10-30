//
//  admin.swift
//  assignment4
//
//  Created by Yining Chen on 10/29/21.
//

import Foundation

class Admin {
    var  userEmailId: String
    var  password: String
    static var nextUid:Int = 0
    static func generateUid() -> Int {
         nextUid+=1
        return nextUid
    }
    let uid: Int
    init(userEmailId:String, password: String ) {
        self.userEmailId=userEmailId
        self.password=password
        self.uid = Admin.generateUid()
    }
    public func getUserEmailId()->String{
        return userEmailId
    }
    public func setUserEmailId(userEmailId:String){
        self.userEmailId=userEmailId
    }
    public func getPassword()->String {
        return password
    }
    public func setPassword(password :String){
        self.password=password
    }
    public func getId()->Int{
        return uid
    }
    public func toString()->String{
        return "\(uid) \(userEmailId) \(password)"
    }
}
