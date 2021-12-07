//
//  StorageManager.swift
//  NEU_PLUS_thoughts
//
//  Created by Yining Chen on 12/7/21.
//

import Foundation
import FirebaseStorage

final class StorageManager{
    static let shared=StorageManager()
    
    private let container=Storage.storage().reference()
    private init(){}
    
    public func uploadUserProfilePicture(email: String,
                                         image:UIImage?,
                                         completion:@escaping(Bool)->Void){
        
    }
    public func uploadBlogHeaderImage(blogPost:BlogPost,image:UIImage?,
                                              completion:@escaping(Bool)->Void){
             
         }
    public func downLoadUrlForPostHeader( blogPost:BlogPost ,completion:@escaping(URL?)->Void){
        
    }
    public func downLoadUrlForPorfilePic(user:User ,completion:@escaping(URL?)->Void){
        
    }
    
    
}
