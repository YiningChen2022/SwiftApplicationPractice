//
//  DatabaseManager.swift
//  NEUPLUS
//
//  Created by Yining Chen on 12/6/21.
//

import Foundation
import FirebaseFirestore

final class DatabaseManage{
    static let shared=DatabaseManage()
    private init(){}
    private let database = Firestore.firestore()
     //add user to data
    public func insertUser( user:User, completion:@escaping(Bool)->Void){
        let documentId = user.email.replacingOccurrences(of: ".", with: "_").replacingOccurrences(of: "@", with: "_")
        let data=["email": user.email,
                  "name":user.name]
        database.collection("users")
            .document(documentId)
            .setData(data){
                error  in
                completion(error == nil)
            }
        
    }
    
    //query all blog posts
    public func getAllPosts(with blogPost:BlogPost, user:User, completion:@escaping([BlogPost])->Void){
        
        
    }
    
    //query blog post of one user
    public func getPostForUser( for user:User, completion:@escaping([BlogPost])->Void){
        
        
    }
    
    //post blog post
    public func insertBlogPost(blogPost:BlogPost, user:User, completion:@escaping(Bool)->Void){
        
        
    }
    
    
}
