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
                    "userName":post.postUser ?? "",
                    "headerImageUrl": post.headerImageUrl?.absoluteString ?? "",
                                  "postUserEmail":post.postUserEmail ?? ""]
        
                    
        
        
        
        database.collection("users").document(userEmail).collection("posts")
            .document(post.identifier)
            .setData(data){
                error in completion(error == nil)
            }
    }
    
    //insert comment to post
    public func insertComments(email:String,postid:String, comments:Comments,completion:@escaping(Bool)->Void ){
        let userEmail=email
            .replacingOccurrences(of: ".", with: "_")
            .replacingOccurrences(of: "@", with: "_")
        let data :[String:Any] = ["id": comments.id,
                                  "body": comments.body,
                                  "created": comments.Date,
                                  "commentedPostid" :comments.commentedPostid,
                                  "commentedEmailid":comments.commentEmail]
                    
        database.collection("users").document(userEmail).collection("posts")
            .document(postid)
            .collection("comments")
            .document(comments.id)
            .setData(data){
                error in completion(error == nil)
            }
    }
    
    //getComment for one post
    public func getCommentForPosts(for email:String, for postid:String, completion:@escaping([Comments])->Void ){
        //first get the user
        let userEmail=email
            .replacingOccurrences(of: ".", with: "_")
            .replacingOccurrences(of: "@", with: "_")
        //get all documents
        //gives dictionary for each doc
        database.collection("users")
            .document(userEmail)
            .collection("posts").document(postid).collection("comments")
            .getDocuments{
                snapshot, error in guard let documents = snapshot?.documents.compactMap({$0.data()}),
                error == nil else {
                    return
                }
                
                let comments :[Comments] = documents.compactMap({
                    dictionary in
                    guard let id=dictionary["id"] as?String,
                          let body=dictionary["body"] as? String,
                          let commentedEmailid=dictionary["commentedEmailid"] as? String,
                          let created=dictionary["created"] as? TimeInterval,
                          let commentedPostid=dictionary["commentedPostid"]as? String
                          else {
                              print("invalid comment fetch conversion")
                              return nil
                          }
                          
                         
                        let comment = Comments(id: id, body: body, Date: created, commentedPostid: commentedPostid, commentEmail: commentedEmailid)
                   
                    return  comment
                    
                })
                completion(comments)
               
                
            }
        
    }
    
    
    //get AllPost
    public func getAllPosts( completion:@escaping([BlogPost])->Void ){
        //get all users
        //from each user, get's there posts
        var result:[BlogPost]=[]
        database.collection("users")
            .getDocuments{ [ weak self]
                snapshot, error in
                guard let documents=snapshot?.documents.compactMap({$0.data()}),
                      error == nil else{
                          return
                      }
                
                let emails:[String] = documents.compactMap({ $0["email"]as? String})
                print(emails)
                guard !emails.isEmpty else{
                    completion([])
                    return
                }
                
                let group = DispatchGroup()
                
                for email in emails{
                    group.enter()
                    self?.getPostForUser(for: email){
                     
                        userPosts in
                        defer{
                            group.leave()
                        }
                        result.append(contentsOf: userPosts)
                    }
                                           
                }
                group.notify(queue: .global()){
                    print ("Feed posts: \(result.count)")
                    completion(result)
                }
            }
        
        
        
        
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
                          let userName=dictionary["userName"] as? String?,
                          let headerImageUrl=dictionary["headerImageUrl"] as? String,
                    let postuserEmail=dictionary["postUserEmail"] as? String?
                    else {
                              print("invalid post fetch conversion")
                              return nil
                          }
                          
                         
                            
                    let post = BlogPost(identifier: id, title: title, timestamp: created, headerImageUrl: URL(string:headerImageUrl), text: body, type: type, postUser: userName, postUserEmail: postuserEmail)
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
    public func removePost (Postid:String,Useremail:String, completion:@escaping(Bool)->()){
        let documentId=Useremail
            .replacingOccurrences(of: ".", with: "_")
            .replacingOccurrences(of: "@", with: "_")
         database.collection("users")
            .document(documentId)
            .collection("posts")
            .document(Postid).delete(){
                error in
                if let error = error{
                    print("erroring in deleting the post")
                    completion(false)
                }else{
                    print("success deleted the post")
                    completion(true)
                }
            }
        
        
    }
    
}
