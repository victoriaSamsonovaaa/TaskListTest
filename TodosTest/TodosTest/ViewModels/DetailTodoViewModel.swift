//
//  DetailTodoViewViewModel.swift
//  TodosTest
//
//  Created by Victoria Samsonova on 22.01.25.
//

import Foundation
import SwiftUI

class DetailTodoViewModel: ObservableObject {

    @Published var todoEntity: ToDoEntity

    init(todoEntity: ToDoEntity) {
        self.todoEntity = todoEntity
    }
    
    func saveChanges() {
        CoreDataManager.shared.saveContext()
    }
}
