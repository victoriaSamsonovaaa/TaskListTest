//
//  TodosListViewViewModel.swift
//  TodosTest
//
//  Created by Victoria Samsonova on 22.01.25.
//

import Foundation
import SwiftData
import SwiftUI

class TodosListViewModel: ObservableObject {
    
    @Published var savedEntities: [ToDoEntity] = []
    @Published var searchText = ""
    
    
    private var todoDataService = TodoDataService()
    
    func fetchTodosFromApi() {
        guard CoreDataManager.shared.getAllTodos().isEmpty else { return }
        todoDataService.fetchFromApi()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            self?.getAllTodos()
        }
    }
    
    func getAllTodos() {
        savedEntities = CoreDataManager.shared.getAllTodos()
    }
    
    func addTodo(todo: String) {
        CoreDataManager.shared.addTodo(todo: todo)
        getAllTodos()
    }
    
    func deleteTodo(todo: ToDoEntity) {
        CoreDataManager.shared.deleteTodo(todo: todo)
        getAllTodos()
    }
    
    func removeTodo(at offsets: IndexSet, from todos: FetchedResults<ToDoEntity>) {
        for index in offsets {
            let todo = todos[index]
            CoreDataManager.shared.deleteTodo(todo: todo)
        }
    }
    
    func filteredTodos(from todos: FetchedResults<ToDoEntity>) -> [ToDoEntity] {
        if searchText.isEmpty {
            return Array(todos)
        } else {
            return todos.filter {
                $0.title.contains(searchText)
            }
        }
    }
    
//    var searchResults: [ToDoEntity] {
//        if searchText.isEmpty {
//            return savedEntities
//        } else {
//            return savedEntities.filter {
//                $0.title.contains(searchText)
//            }
//        }
//    }

}
