//
//  ToDoItem.swift
//  TaskListViper
//
//  Created by Victoria Samsonova on 20.01.25.
//

import Foundation

struct ToDoItem {
    var id: Int
    var todo: String
    var completed: Bool
    var userId: Int
    
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
    
}
