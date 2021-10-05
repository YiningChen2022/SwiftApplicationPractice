//
//  StorageManager.swift
//  NEUBlogIdea
//
//  Created by Yining Chen on 10/5/21.
//

import Foundation
import FirebaseStorage

final class StorageManager{
    static let shared=StorageManager()
    private let database=Storage.storage()
    private init(){}
}
