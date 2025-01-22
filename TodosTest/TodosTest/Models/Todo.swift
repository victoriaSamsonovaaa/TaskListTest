//
//  Todo.swift
//  TodosTest
//
//  Created by Victoria Samsonova on 22.01.25.
//

import Foundation

struct Todo: Codable {
    let id: Int16
    let userId: Int16
    let completed: Bool
    let todo: String?
}

struct TodoResponse: Codable {
    let todos: [Todo]
}
