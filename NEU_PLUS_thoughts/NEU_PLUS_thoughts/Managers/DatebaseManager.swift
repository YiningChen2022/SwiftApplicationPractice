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
    public func insertBlogPost(post:BlogPost, email:String, completion:@escaping(Bool)->Void ){
        let userEmail=email
            .replacingOccurrences(of: ".", with: "_")
            .replacingOccurrences(of: "@", with: "_")
        let data :[String:Any] = ["id": post.identifier,
            "title": post.title,
                    "body": post.text,
                    "created": post.timestamp,
                    "type" :post.type,
                    "headerImageUrl": post.headerImageUrl?.absoluteString ?? ""]
        
        
        database.collection("users").document(userEmail).collection("posts")
            .document(post.identifier)
            .setData(data){
                error in completion(error == nil)
            }
           
          
        
        
    }
    
    //get AllPost
    public func getAllPosts( completion:@escaping([BlogPost])->Void ){
    }
    //getPost for one user
    public func getPostForUser(for email:String, completion:@escaping([BlogPost])->Void ){
        //first get the user
        let userEmail=email
            .replacingOccurrences(of: ".", with: "_")
            .replacingOccurrences(of: "@", with: "_")
        //get all documents
        //gives dictionary for each doc
        database.collection("users")
            .document(userEmail)
            .collection("posts")
            .getDocuments{
                snapshot, error in guard let documents = snapshot?.documents.compactMap({$0.data()}),
                error == nil else {
                    return
                }
                
                let posts :[BlogPost] = documents.compactMap({
                    dictionary in
                    guard let id=dictionary["id"] as?String,
                          let title=dictionary["title"] as? String,
                          let body=dictionary["body"] as? String,
                          let created=dictionary["created"] as? TimeInterval,
                          let type=dictionary["type"] as? String,
                          let headerImageUrl=dictionary["headerImageUrl"] as? String else {
                              print("invalid post fetch conversion")
                              return nil
                          }
                          
                         
                            
                    let post = BlogPost(identifier: id, title: title, timestamp: created, headerImageUrl: URL(string:headerImageUrl), text: body, type: type)
                    return post
                    
                })
                completion(posts)
               
                
            }
        
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
    //get Profile
    public func getUser(email:String, completion:@escaping(User?)->Void){
        let documentId=email
            .replacingOccurrences(of: ".", with: "_")
            .replacingOccurrences(of: "@", with: "_")
        database
            .collection("users")
            .document(documentId)
            .getDocument { snapshot, error in
                guard let data = snapshot?.data() as? [String:String], let name = data["name"],error == nil else{
                    return
                }
                let ref = data["profile_photo"]//ref
                let user = User(name:name, email:email, profulePictureRef: ref)
                    completion(user)
              
                
            }
    }
    
    public func updateProfilePhoto(email:String, completion:@escaping(Bool)->Void){
        //us email for the uniqu key
        let path = email.replacingOccurrences(of: "@", with: "_")
            .replacingOccurrences(of: ".", with: "_")
        let photoReference="profile_pictures/\(path)/photo.png"
        
        //create a reference
        let dbRef=database.collection("users")
            .document(path)
        //update latest value
        dbRef.getDocument {
            snapshot, error in guard var data=snapshot?.data(), error == nil else {
                return
            }
          data["profile_photo"] = photoReference
            dbRef.setData(data) {error in completion(error == nil)}
        }
        
    }
    
}
