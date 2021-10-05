//
//  StorageManager.swift
//  NEUBlogIdea
//
//  Created by Yining Chen on 10/5/21.
//

import Foundation
import FirebaseStorage

final class StorageManager{
    static let shared=StorageManager()
    private let container=Storage.storage().reference()
    private init(){}
    
    public func uploadUserProfilePicture(email:String, image:UIImage?,completion:@escaping (Bool)->Void){
        
    }
    public func downloadUrlaForProfilePicture(user:User, completion:@escaping(URL?)->Void){
        
    }
    public func uploadBlogHeaderImage(blogPost:BlogPost, image:UIImage?,completion:@escaping (Bool)->Void){
        
    }
    public func downloadUrlaForPostHeader(blogPost:BlogPost, completion:@escaping(URL?)->Void){
        
    }
}
