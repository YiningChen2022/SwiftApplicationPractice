//
//  AutoManager.swift
//  NEUPLUS
//
//  Created by Yining Chen on 12/6/21.
//

import Foundation
import FirebaseAuth

final class AuthManage{
    static let shared=AuthManage()
    private init(){}
    private let auth = Auth.auth()
    //sign in
    public func signIn(email:String,password:String, completion:@escaping(Bool)->Void){
        auth.signIn(withEmail: email, password: password){
            result, error in guard result != nil, error == nil else{
                completion(false)
                return
            }
        }
    }
    
    //whether user is signed in or not
    public var isSignedIn:Bool{
        return auth.currentUser != nil
    }
    
    //sign out
    public func signOut( completion:@escaping(Bool)->Void){
        do{
            try auth.signOut()
            completion(true)
        }catch{
            print(error)
            completion(false)
            
        }
    }
    //sign up
    public func signUp(email:String,password:String, completion:@escaping(Bool)->Void){
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              password.count>=6 else {
                  return
              }
        auth.createUser(withEmail: email, password: password){
            result, error in guard result != nil, error == nil else{
                //account created
                completion(false)
                return
                
            }
        }
              
        
        
    }
   
     
}
