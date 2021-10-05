//
//  DatabaseManager.swift
//  NEUBlogIdea
//
//  Created by Yining Chen on 10/5/21.
//

import Foundation
import FirebaseFirestore

final class DatabaseManager{
    static let shared=DatabaseManager()
    private let database=Firestore.firestore()
    private init(){}
}
