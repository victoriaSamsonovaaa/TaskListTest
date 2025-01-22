//
//  ToDoEntity+CoreDataProperties.swift
//  TodosTest
//
//  Created by Victoria Samsonova on 22.01.25.
//
//

import Foundation
import CoreData


extension ToDoEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoEntity> {
        return NSFetchRequest<ToDoEntity>(entityName: "ToDoEntity")
    }

    @NSManaged public var completed: Bool
    @NSManaged public var createdAt: Date?
    @NSManaged public var id: Int16
    @NSManaged public var todo: String?
    @NSManaged public var userId: Int16

    var title: String {
        return todo?.components(separatedBy: " ").first ?? ""
    }
    
    var curDate: String {
        return createdAt?.formatted(date: .abbreviated, time: .omitted) ?? ""
    }
}

extension ToDoEntity : Identifiable {

}

