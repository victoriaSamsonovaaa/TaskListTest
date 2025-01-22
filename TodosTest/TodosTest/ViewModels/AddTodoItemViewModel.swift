//
//  AddTodoItemViewModel.swift
//  TodosTest
//
//  Created by Victoria Samsonova on 22.01.25.
//

import Foundation

class AddTodoItemViewModel: ObservableObject {
    @Published var newTodoText: String = ""
    private let coreDataViewModel: CoreDataViewModel
    
    init(coreDataViewModel: CoreDataViewModel) {
        self.coreDataViewModel = coreDataViewModel
    }
        
    func addNewTodo() {
        coreDataViewModel.addTodo(newTodoText)
    }
}
