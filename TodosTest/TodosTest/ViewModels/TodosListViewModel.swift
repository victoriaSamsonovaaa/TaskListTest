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
    
    var searchResults: [ToDoEntity] {
        if searchText.isEmpty {
            return savedEntities
        } else {
            return savedEntities.filter {
                $0.todo?.localizedCaseInsensitiveContains(searchText) ?? false
            }
        }
    }
}
