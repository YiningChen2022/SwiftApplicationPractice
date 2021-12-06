//
//  StorageManager.swift
//  NEUPLUS
//
//  Created by Yining Chen on 12/6/21.
//

import Foundation

import FirebaseStorage

final class StorageManage{
    static let shared=StorageManage()
    private init(){}
    private let container = Storage.storage().reference()
    public func uploadUserProfilePictur(
        email:String,
        image:UIImage?,
        completion:@escaping(Bool)->Void
    ){
        
    }
    public func downLoadURLforProfilePic(
        user:User,
        completion:@escaping(URL?)->Void){
            
        }
    
    public func UploadBlogHeaderImage(
        blogPost:BlogPost,
        image: UIImage?,
        completion:@escaping(Bool)->Void){
            
        }
    public func downLoadURLForPostHeader(
        blogPost:BlogPost,
        completion:@escaping(Bool)->Void){
            
        }
}
