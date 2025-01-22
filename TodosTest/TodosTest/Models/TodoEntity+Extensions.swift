//
//  TodosModel+Extensions.swift
//  TodosTest
//
//  Created by Victoria Samsonova on 22.01.25.
//

import Foundation

extension ToDoEntity {
    var title: String {
        return todo?.components(separatedBy: " ").first ?? ""
    }
    
    var curDate: String {
        return createdAt?.formatted(date: .abbreviated, time: .omitted) ?? ""
    }
}
