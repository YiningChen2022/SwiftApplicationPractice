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
    private let storage = Storage.storage()
     
}
