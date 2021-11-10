//
//  ManageCategory.swift
//  Assignment5
//
//  Created by Yining Chen on 11/10/21.
//

import Foundation
public func manageCategory(){
    var end=false
    while(!end){
        //manage category
            print("Select options :")
            print("1.add  category")
            print("2.update  category")
            print("3.Delete  category")
            print("4.View All  category")
        print("5. Go To Upper Level")

            let selected : String? = readLine()
            switch selected!{
            case "1":
                print("Enter  category Name: ")
                let name : String? = readLine()

               
                if (name != "" ){
                    let category5 = Category(name: name!)
                    testCategorylist.addCategory(Category: category5)
             
                    print("--------------------Category added---------------")
                    testCategorylist.toString()
                }else{
                    print("input invalied")
                }
            case "2":
                testCategorylist.toString()
                print("Select Category id:")
                let  categoryid: String? = readLine()
                if categoryid != nil && categoryid != ""{
                    let  categoryid1 = Int(categoryid!)
                    let curr = testCategorylist.getCategory(id: categoryid1!)
                    if curr != nil {
                        print("updated Name")
                        let name : String? = readLine()
                              testCategorylist.UpdateCategory(id: curr!.id, name: name!)

                        print("--------------------Category updated ---------------")
                         testCategorylist.toString()
                    }else{
                        print("user Not founded")
                    }
                }else {
                    print("Invalid input")
                }
            case "3":
                testCategorylist.toString()
                print("Select Category id to delete:")
                let  Categoryid: String? = readLine()
                if Categoryid != nil && Categoryid != ""{
                    let  Categoryid1 = Int(Categoryid!)
                    let curr=testCategorylist.getCategory(id: Categoryid1!)
                    if curr != nil {
                        testCategorylist.DeleteCategory(id: curr!.id)
                        print("--------------------Category Deleted ---------------")
                        testCategorylist.toString()
                    }else{
                        print("user Not founded")
                    }
                }else {
                    print("Invalid input")
                }
                
            case "4":
                testCategorylist.toString()
            case "5":
                end=true
            default:
                print("input invalid")
            }
    }
}
