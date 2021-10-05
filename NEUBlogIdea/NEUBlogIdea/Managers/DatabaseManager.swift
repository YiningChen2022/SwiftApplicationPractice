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
    
    public func insertBlogPost( with post: String,user: String, completion: @escaping(Bool)-> Void){
     
    }
    
    public func getAllPosts( with post: String,user: String, completion: @escaping([String])-> Void){
     
    }
    public func gePostsForUser( with post: String,user: String, completion: @escaping([String])-> Void){
     
    }
    public func insertUser(user: String, completion: @escaping(Bool)-> Void){
     
    }
}
