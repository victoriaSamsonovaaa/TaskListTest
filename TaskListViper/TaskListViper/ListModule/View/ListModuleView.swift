//
//  ContentView.swift
//  TaskListViper
//
//  Created by Victoria Samsonova on 20.01.25.
//

import SwiftUI

struct ListModuleView: View {
    
    @State private var todos: [ToDoItem] = []

    var body: some View {
        NavigationStack {
            LazyVStack {
                List(todos, id: \.id) { todo in
                    NavigationLink {
                        ItemModuleView()
                    } label: {
                        HStack {
                            Image(systemName: todo.completed ? "checkmark.circle" : "circle")
                                .foregroundStyle(todo.completed ? .yellow : .secondary)
                            VStack {
                                Text(todo.title)
                                    .strikethrough(todo.completed, color: .secondary)
                                    .bold()
                                Text(todo.todo)
                                    .tint(.secondary)
                            }
                            .foregroundStyle(todo.completed ? .primary : .secondary)
                        }
                    }
                }
            }
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
            .tint(.yellow)
        }
    }
}

#Preview {
    ListModuleView()
}
