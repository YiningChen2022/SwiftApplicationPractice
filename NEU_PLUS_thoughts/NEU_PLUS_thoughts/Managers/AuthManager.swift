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
    
    //sign up
    
    //sign out
    
    //if signed in
          public var isSignedIn: Bool{
        return auth.currentUser != nil
    }
    public func signUp(email: String,
                       password: String,
                       completion:@escaping (Bool)->Void){
        
    }
         
    
}
