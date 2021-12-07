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
    
    private let database=Storage.storage()
    private init(){}
}
