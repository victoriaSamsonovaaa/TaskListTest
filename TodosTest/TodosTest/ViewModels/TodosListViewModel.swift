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
    @Published var isLoading = false
    
    
    private var todoDataService = TodoDataService()
    
    func fetchTodosFromApi() {
        guard savedEntities.isEmpty else { return }
        isLoading = true
        todoDataService.fetchFromApi()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            self?.getAllTodos()
            self?.isLoading = false
        }
    }
    
    func getAllTodos() {
        savedEntities = CoreDataManager.shared.getAllTodos()
    }
    
    func addTodo(todo: String) {
        CoreDataManager.shared.addTodo(todo: todo)
        getAllTodos()
    }
    
    func updateTodos() {
        CoreDataManager.shared.saveContext()
        getAllTodos()
    }
    
    
    func deleteTodo(todo: ToDoEntity) {
        CoreDataManager.shared.deleteTodo(todo: todo)
        getAllTodos()
    }
    
    func removeTodo(at offsets: IndexSet) {
        for index in offsets {
            let todo = searchResults[index]
            deleteTodo(todo: todo)
        }
    }
    
    var searchResults: [ToDoEntity] {
        if searchText.isEmpty {
            return savedEntities
        } else {
            return savedEntities.filter {
                $0.title.contains(searchText)
            }
        }
    }

}
