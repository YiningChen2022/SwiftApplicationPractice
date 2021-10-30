//
//  AdminDirectory.swift
//  assignment4
//
//  Created by Yining Chen on 10/29/21.
//

import Foundation
class AdminDirecrtory {
    var AdminList: [Admin]
    init(AdminList:Array<Admin>){
        self.AdminList = []
    }
    
    public func getAdmin(Id:Int)->Admin?{
        var curr:Admin?
        for admin in AdminList{
            if admin.getId() == (Id){
                curr=admin
            }
        }
        return curr
    }

    public func addAdminProfile(admin:Admin){
        AdminList.append(admin)
    }
    public func updateAdminProfile(admin:Admin, password:String, email:String){
        if (password != ""){
            admin.setPassword(password:password)
        }
        if (email != ""){
            admin.setUserEmailId(userEmailId: email)
        }
    }
    public func deleteAdminProfile(Id: Int)->Bool{
                for (index, value) in AdminList.enumerated() {
                    if value.uid==(Id) {
                        AdminList.remove(at: index)
                        return true
                    }
            }
        return false 
    }
    public func validAdmin(email:String, password:String)->Bool{
        for admin in AdminList {
            if (admin.password == password && admin.userEmailId == email){
                return true;
            }
    }
        return false;
    }
    public func toString(){
        for Admin in AdminList {
            print (Admin.toString())
    }
}
}
