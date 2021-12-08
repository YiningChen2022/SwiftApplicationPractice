//
//  DatebaseManager.swift
//  NEU_PLUS_thoughts
//
//  Created by Yining Chen on 12/7/21.
//

import Foundation
import FirebaseFirestore
final class DatabaseManager{
    static let shared=DatabaseManager()
    
    private let database=Firestore.firestore()
    private init(){}
    
    //post Blog
    public func insertBlogPost(post:BlogPost, user:User, completion:@escaping(Bool)->Void ){
        
    }
    
    //get AllPost
    public func getAllPosts( completion:@escaping([BlogPost])->Void ){
    }
    //getPost for one user
    public func getPostForUser(for user:User, completion:@escaping([BlogPost])->Void ){
    }
    
    //insert User

    public func insertUser( user:User, completion:@escaping(Bool)->Void ){
        let documentId=user.email
            .replacingOccurrences(of: ".", with: "_")
            .replacingOccurrences(of: "@", with: "_")
        let data = ["email": user.email,
                  "name": user.name]
        
        database.collection("users").document(documentId).setData(data){
            error in completion(error == nil)
        }
        
    }
}
