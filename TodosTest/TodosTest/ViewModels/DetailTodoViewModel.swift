//
//  DetailTodoViewViewModel.swift
//  TodosTest
//
//  Created by Victoria Samsonova on 22.01.25.
//

import Foundation
import SwiftUI

final class DetailTodoViewModel: ObservableObject {

    @Published var todoEntity: ToDoEntity

    init(todoEntity: ToDoEntity) {
        self.todoEntity = todoEntity
    }
    
    func saveChanges() {
        if todoEntity.todo?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == true {
            CoreDataManager.shared.deleteTodo(todo: todoEntity)
        } else {
            CoreDataManager.shared.saveContext()
        }
    }
}
