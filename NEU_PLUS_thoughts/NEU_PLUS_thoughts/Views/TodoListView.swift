//
//  TodoListView.swift
//  NEU_PLUS_thoughts
//
//  Created by Yining Chen on 8/18/24.
//

import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel = ToDoListViewViewModel()
    

    
    var body: some View {
        NavigationView{
            VStack{
                
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button{
                    viewModel.showingNewItemView = true
                }label: {
                    Image(systemName:"plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView){
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    TodoListView()
}


// Link the storyboard to swift ui
// so a new way to code in swift is to use swift ui
// 1. add this class which calls this toDoListView
// 2. in the story board, add this ToDoListVHCL to the file directory

class ToDoListVHCL: UIHostingController<TodoListView>{
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder, rootView :TodoListView() )
    }

}

