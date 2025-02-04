//
//  AddTodoItemViewModel.swift
//  TodosTest
//
//  Created by Victoria Samsonova on 22.01.25.
//

import Foundation

final class AddTodoItemViewModel: ObservableObject {
    
    @Published var newTodoText: String = ""
    @Published var curDate: Date = Date()

    func addNewTodo() {
        CoreDataManager.shared.addTodo(todo: newTodoText)
    }
}
