//
//  DatabaseManager.swift
//  NEUBlogIdea
//
//  Created by Yining Chen on 10/5/21.
//

import Foundation
import FirebaseFirestore

final class DatabaseManager{
    static let shared=DatabaseManager()
    private let database=Firestore.firestore()
    private init(){}
    
    public func insert( blogPost: BlogPost,user: User, completion: @escaping(Bool)-> Void){
     
    }
    
    public func getAllPosts( completion: @escaping([BlogPost])-> Void){
     
    }
    public func gePosts(for user:User, completion: @escaping([BlogPost])-> Void){
     
    }
    public func insert(user: User, completion: @escaping(Bool)-> Void){
        let ref = user.email.replacingOccurrences(of: ".", with: "_").replacingOccurrences(of: "@", with: "_")
        
        let data = ["email": user.email,
                   "name":user.name]
        database.collection("Users")
            .document(ref)
            .setData(data){
                error in
                completion(error==nil)
            }
     
    }
}
