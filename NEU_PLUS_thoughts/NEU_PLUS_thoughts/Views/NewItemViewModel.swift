//
//  NewItemViewModel.swift
//  NEU_PLUS_thoughts
//
//  Created by Yining Chen on 8/19/24.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

class NewItemViewModel: ObservableObject{
    @Published var title = ""
    @Published var dueDate = Date ()
    @Published var showAlert = false
    
    init(){
        
    }
    func save(){
        guard canSave else {
            return
        }
        
        // Get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Create model
        let newID = UUID().uuidString
        let newItem = ToDoListItem(
            id: newID,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        
        // Save model
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newID)
            .setData(newItem.asDictionary())
    }
    
    var canSave :Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
