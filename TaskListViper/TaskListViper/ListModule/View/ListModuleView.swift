//
//  ContentView.swift
//  TaskListViper
//
//  Created by Victoria Samsonova on 20.01.25.
//

import SwiftUI

struct ListModuleView: View {
    
    @State private var todos: [ToDoItem] = [ToDoItem(id: 1, todo: "Do sport", completed: false, userId: 203), ToDoItem(id: 2, todo: "Do sport", completed: true, userId: 203)]

    var body: some View {
        NavigationSplitView {
            List(todos, id: \.id) { todo in
                NavigationLink {
                    ItemModuleView()
                } label: {
                    ToDoRowView(todo: todo)
                }
            }
            .listStyle(.inset)
            .navigationTitle("Tasks")
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    Text("\(todos.count) \(todos.count == 1 ? "task" : "tasks")")
                        .foregroundStyle(.secondary)
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }
                }
            }
            
        } detail: {
            Text("")
        }
        .tint(.yellow)
    }
}

#Preview {
    ListModuleView()
}
