//
//  AuthManager.swift
//  NEUBlogIdea
//
//  Created by Yining Chen on 10/5/21.
//

import Foundation
import FirebaseAuth

final class AuthManager{
    static let shared=AuthManager()
    private let database=Auth.auth()
    private init(){}
}
