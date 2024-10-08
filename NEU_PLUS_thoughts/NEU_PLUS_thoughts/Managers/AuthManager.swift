
//
//  AuthManager.swift
//  NEU_PLUS_thoughts
//
//  Created by Yining Chen on 12/7/21.
//

import Foundation
import FirebaseAuth

final class AuthManager{
    static let shared=AuthManager()
    
    private let auth = Auth.auth()
     
    private init(){}
    
    //sign in
    public func signIn(email: String,
                       password: String,
                       completion:@escaping (Bool)->Void){
        guard !email.trimmingCharacters(in:  .whitespaces).isEmpty,
              !password.trimmingCharacters(in:  .whitespaces).isEmpty,
              password.count>=6 else {
                  return
              }
        auth.signIn(withEmail: email, password: password){
            result, error in guard result != nil, error == nil else{
                completion(false)
                return
            }
            completion(true)
        }
    }
    //sign up
    public func signUp(email: String,
                       password: String,
                       completion:@escaping (Bool)->Void){
        guard !email.trimmingCharacters(in:  .whitespaces).isEmpty,
              !password.trimmingCharacters(in:  .whitespaces).isEmpty,
              password.count>=6 else {
                  return
              }
        auth.createUser(withEmail: email, password: password){
            result, error in guard result != nil, error == nil else{
                completion(false)
                return
            }
            //account created
            completion(true)
        
        }
        
    }
    //sign out
    public func signOut(
                       completion: (Bool)->Void){
                           do {
                               try auth.signOut()
                               completion(true)
                           }
                           catch {
                               completion(false)
                           }
        
        
    }
    
    //if signed in
          public var isSignedIn: Bool{
        return auth.currentUser != nil
    }

         
    
}
