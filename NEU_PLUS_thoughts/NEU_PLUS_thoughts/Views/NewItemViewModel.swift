//
//  NewItemViewModel.swift
//  NEU_PLUS_thoughts
//
//  Created by Yining Chen on 8/19/24.
//

import SwiftUI

class NewItemViewModel: ObservableObject{
    @Published var title = ""
    @Published var dueDate = Date ()
    
    init(){
        
    }
    func save(){
        
        
        
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
