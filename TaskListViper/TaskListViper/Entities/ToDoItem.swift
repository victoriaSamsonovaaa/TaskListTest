//
//  ToDoItem.swift
//  TaskListViper
//
//  Created by Victoria Samsonova on 20.01.25.
//

import Foundation

class ToDoItem {
    var id: Int
    var todo: String
    var completed: Bool
    var userId: Int
    
    var title: String {
        return todo.components(separatedBy: " ").first ?? " "
    }
    
    
    init(id: Int, todo: String, completed: Bool, userId: Int) {
        self.id = id
        self.todo = todo
        self.completed = completed
        self.userId = userId
    }
}
