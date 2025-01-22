//
//  AddTodoItemViewModel.swift
//  TodosTest
//
//  Created by Victoria Samsonova on 22.01.25.
//

import Foundation

class AddTodoItemViewModel: ObservableObject {
    @Published var newTodoText: String = ""

    func addNewTodo(todo: String) {
        CoreDataManager.shared.addTodo(todo: todo)
        saveTodo()
    }
    
    func saveTodo() {
        CoreDataManager.shared.saveContext()
    }
}
