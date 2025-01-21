//
//  ToDoItem.swift
//  TaskListViper
//
//  Created by Victoria Samsonova on 20.01.25.
//

import Foundation

struct ToDoItem: Codable {
    var id: Int16
    var todo: String
    var completed: Bool
    var userId: Int16
    
    var title: String {
        return todo.components(separatedBy: " ").first ?? " "
    }
    
//    var curDate: String {
//        let date = Date()
//        return date.formatted(date: .abbreviated, time: .omitted)
//    }
    
    var curDate: String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy" 
        return formatter.string(from: date)
    }

    init(id: Int16, todo: String, completed: Bool, userId: Int16) {
        self.id = id
        self.todo = todo
        self.completed = completed
        self.userId = userId
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int16.self, forKey: .id)
        self.todo = try container.decode(String.self, forKey: .todo)
        self.completed = try container.decode(Bool.self, forKey: .completed)
        self.userId = try container.decode(Int16.self, forKey: .userId)
    }
    
    init(from managedObject: ItemModel) {
        self.id = managedObject.id
        self.todo = managedObject.todo!
        self.completed = managedObject.completed
        self.userId = managedObject.userId
    }
}


struct TodoResponse: Codable {
    let todos: [ToDoItem]
}
