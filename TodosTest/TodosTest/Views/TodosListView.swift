//
//  TodosListView.swift
//  TodosTest
//
//  Created by Victoria Samsonova on 22.01.25.
//

import SwiftUI

struct TodosListView: View {
    @StateObject private var viewModel = TodosListViewModel()
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \ToDoEntity.createdAt, ascending: false)]
    ) var todos: FetchedResults<ToDoEntity>

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.filteredTodos(from: todos), id: \.id) { todo in
                    NavigationLink {
                        DetailTodoView(todo: todo)
                    } label: {
                        ToDoRowView(todo: todo)
                    }
                }
                .onDelete {
                    viewModel.removeTodo(at: $0, from: todos)
                }
            }
            .listStyle(.inset)
            .navigationTitle("Tasks")
            .searchable(text: $viewModel.searchText)
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    Text("\(viewModel.filteredTodos(from: todos).count) \(viewModel.filteredTodos(from: todos).count == 1 ? "task" : "tasks")")
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
        .onAppear {
            viewModel.getAllTodos()
            if viewModel.savedEntities.isEmpty {
                viewModel.fetchTodosFromApi()
            }
        }
    }
}

#Preview {
    TodosListView()
}
