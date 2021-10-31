//
//  CategoryDirectory.swift
//  Assignment5
//
//  Created by Yining Chen on 10/24/21.
//

import Foundation
class CategoryDirecrtory {
    var catagoryList: [Category]
    init(catagoryList:Array<Category>){
        self.catagoryList = []
    }
    public func addCategory(Category:Category){
        catagoryList.append(Category)
    }
    public func getCategory(id:Int)->Category?{
        var curr: Category?
        for (_, value) in catagoryList.enumerated() {
            if value.id==id {
                curr=value
            }
        }
       return curr
    }
    
    public func DeleteCategory(id:Int){
        for (index, value) in catagoryList.enumerated() {
            if value.id==id {
                catagoryList.remove(at: index)
            }
            
        }
    }
    public func UpdateCategory (id:Int,name: String){
        if name == "" {
            print("please input name")
        }else {
        for (index, value) in catagoryList.enumerated() {
            if value.id==id &&  name != "" {
                value.setName(name: name)
            }
            
        }
        }
    }
    
    public func getsize ()->Int{
        var count=0;
        for _ in catagoryList{
            count+=1;
        }
        return count
    }
    public func toString()->Array<String>{
        var str:Array<String>=[]
        for category in catagoryList {
            str.append(category.toString())
        }
        return str
        
    }
    public func toString(){
        for   catagory in catagoryList {
            print ( catagory.toString())
        }
    }
}
