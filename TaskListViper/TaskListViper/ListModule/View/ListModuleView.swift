//
//  ContentView.swift
//  TaskListViper
//
//  Created by Victoria Samsonova on 20.01.25.
//

import SwiftUI

struct ListModuleView: View {
    
    @State private var searchText = ""
    @State private var todos: [ToDoItem] = [ToDoItem(id: 1, todo: "Do sport", completed: false, userId: 203), ToDoItem(id: 2, todo: "Hacer deporte", completed: true, userId: 203)]

    var body: some View {
        NavigationStack {
            List(searchResults, id: \.id) { todo in
                NavigationLink {
                    ItemModuleView(todo: todo)
                } label: {
                    ToDoRowView(todo: todo)
                }
            }
            .listStyle(.inset)
            .navigationTitle("Tasks")
            .searchable(text: $searchText)
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    Text("\(todos.count) \(todos.count == 1 ? "task" : "tasks")")
                        .foregroundStyle(.secondary)
                    Spacer()
                    NavigationLink {
                        AddItemModuleView()
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }

                }
            }
            
        } 
        .tint(.yellow)
    }
    
    //потом перенести
    var searchResults: [ToDoItem] {
        if searchText.isEmpty {
            return todos
        } else {
            return todos.filter {
                $0.title.contains(searchText)
            }
        }
    }
}

#Preview {
    ListModuleView()
}
