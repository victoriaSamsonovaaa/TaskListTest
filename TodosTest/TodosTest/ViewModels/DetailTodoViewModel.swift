//
//  DetailTodoViewViewModel.swift
//  TodosTest
//
//  Created by Victoria Samsonova on 22.01.25.
//

import Foundation
import SwiftUI

class DetailTodoViewModel: ObservableObject {
    
    @Published var todoText: String = ""
    @State private var coreDataViewModel = CoreDataViewModel()
    private let todo = ToDoEntity()
    
    
    var todoTitle: String {
        return todo.todo?.components(separatedBy: " ").first ?? "Untitled"
    }
    
    var todoCurDate: String {
        return todo.createdAt?.formatted(date: .abbreviated, time: .shortened) ?? "Unknown Date"
    }
    
    func saveChanges() {
        coreDataViewModel.updateTodo(todo, todoText: todoText)
    }
}
