//
//  TodoListView.swift
//  NEU_PLUS_thoughts
//
//  Created by Yining Chen on 8/18/24.
//

import SwiftUI

struct TodoListView: View {
    
    
    var body: some View {
        NavigationView{
            VStack{
                
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button{
                    //action
                }label: {
                    Image(systemName:"plus")
                }
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

