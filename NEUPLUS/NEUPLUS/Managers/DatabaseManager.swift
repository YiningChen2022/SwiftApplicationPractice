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
    public func insertUser( user:String, completion:@escaping([String])->Void){
        
        
    }
    
    //query all blog posts
    public func getAllPosts(with post:String, user:String, completion:@escaping([String])->Void){
        
        
    }
    
    //query blog post of one user
    public func getPostForUser(with post:String, user:String, completion:@escaping(Bool)->Void){
        
        
    }
    
    //post blog post
    public func insertBlogPost(with post:String, user:String, completion:@escaping(Bool)->Void){
        
        
    }
    
    
}
