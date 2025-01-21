//
//  TodosListView.swift
//  TodosTest
//
//  Created by Victoria Samsonova on 22.01.25.
//

import SwiftUI

struct ListModuleView: View {
    @StateObject var vm = CoreDataViewModel()
    
    
    //@State private var searchText = ""
   // @State private var todos: [ToDoEntity] = [ToDoEntity(id: 1, todo: "Do sport", completed: false, userId: 203), ToDoEntity]

    var body: some View {
        NavigationStack {
            List(vm.savedEntities, id: \.id) { todo in
                NavigationLink {
                   // ItemModuleView(todo: todo)
                    DetailTodoView()
                } label: {
                    ToDoRowView(todo: todo)
                }
            }
            .listStyle(.inset)
            .navigationTitle("Tasks")
            .searchable(text: $vm.searchText)
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                  //  Text("\(todos.count) \(todos.count == 1 ? "task" : "tasks")")
                        .foregroundStyle(.secondary)
                    Spacer()
                    NavigationLink {
                        AddTodoItemView()
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }

                }
            }
            
        }
        .tint(.yellow)
    }
    
    //потом перенести
//    var searchResults: [ToDoEntity] {
//        if searchText.isEmpty {
//            return todos
//        } else {
//            return todos.filter {
//                $0.title.contains(searchText)
//            }
//        }
//    }
}

#Preview {
    ListModuleView()
}
