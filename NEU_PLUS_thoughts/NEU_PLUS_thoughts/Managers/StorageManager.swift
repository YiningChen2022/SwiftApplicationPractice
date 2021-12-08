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
    
    private let container=Storage.storage()
    private init(){}
    
    public func uploadUserProfilePicture(email: String,
                                         image:UIImage?,
                                         completion:@escaping(Bool)->Void){
        let path = email.replacingOccurrences(of: "@", with: "_")
            .replacingOccurrences(of: ".", with: "_")
        guard let pngDate = image?.pngData()else {
            return
        }
        
        container.reference(withPath: "profile_pictures/\(path)/photo.png")
            .putData(pngDate, metadata: nil){
                metadata,error in
                guard metadata != nil,error == nil else{
                   completion(false)
                    return
                }
                completion(true)
            }
        
    }
    public func uploadBlogHeaderImage(blogPost:BlogPost,image:UIImage?,
                                              completion:@escaping(Bool)->Void){
             
         }
    public func downLoadUrlForPostHeader( blogPost:BlogPost ,completion:@escaping(URL?)->Void){
        
    }
    public func downLoadUrlForPorfilePic(path:String ,completion:@escaping(URL?)->Void){
        container.reference(withPath: path).downloadURL{
            url,_ in completion(url)
        }
        
    }
    
    
}
