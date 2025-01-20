//
//  ToDoItem.swift
//  TaskListViper
//
//  Created by Victoria Samsonova on 20.01.25.
//

import Foundation

struct ToDoItem: Codable {
    var id: UUID
    var todo: String
    var completed: Bool
    
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

    init(id: UUID, todo: String, completed: Bool) {
        self.id = id
        self.todo = todo
        self.completed = completed
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.todo = try container.decode(String.self, forKey: .todo)
        self.completed = try container.decode(Bool.self, forKey: .completed)
    }
    
    init(from managedObject: Item) {
        self.id = managedObject.id
        self.todo = managedObject.todo!
        self.completed = managedObject.completed
    }
}


struct TodoResponse: Codable {
    let todos: [ToDoItem]
}
