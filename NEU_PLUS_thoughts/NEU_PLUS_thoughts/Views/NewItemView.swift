//
//  NewItemView.swift
//  NEU_PLUS_thoughts
//
//  Created by Yining Chen on 8/19/24.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewModel()
    @Binding var  newItemPresented: Bool 
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size:32))
                .bold()
                .padding(.top, 100 )
            Form {
                //title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                // due date
                DatePicker ("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                //Button
                Button("Save", action: {
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPresented = false
                    }else {
                        viewModel.showAlert = true
                        
                    }
                }).padding()
            }.alert (isPresented: $viewModel.showAlert){
                Alert (title:Text("Error"), message: Text( "Please fill in all fields and select due data that is today or newer "))
            }
        }
    
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get:{
        return true
    }, set: { _ in
        
    }))
}
