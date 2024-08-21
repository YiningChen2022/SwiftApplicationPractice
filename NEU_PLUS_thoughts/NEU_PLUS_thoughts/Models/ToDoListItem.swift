//
//  ToDoListItem.swift
//  NEU_PLUS_thoughts
//
//  Created by Yining Chen on 8/20/24.
//


import Foundation


struct ToDoListItem: Codable, Identifiable{
    let id:String
    let title:String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone (_ state:Bool){
        isDone = state
        
    }
    
    var asDictionary : [String:Any] {
       let mirror = Mirror(reflecting: self)
       let dict = Dictionary(uniqueKeysWithValues: mirror.children.lazy.map({ (label:String?, value:Any) -> (String, Any)? in
         guard let label = label else { return nil }
         return (label, value)
       }).compactMap { $0 })
       return dict
     }
    
    
}
