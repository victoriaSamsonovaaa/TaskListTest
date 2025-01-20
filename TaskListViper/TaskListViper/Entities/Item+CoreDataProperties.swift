//
//  Item+CoreDataProperties.swift
//  TaskListViper
//
//  Created by Victoria Samsonova on 21.01.25.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var id: UUID
    @NSManaged public var todo: String?
    @NSManaged public var completed: Bool
    @NSManaged public var title: String?
    @NSManaged public var curDate: Date?

}

extension Item : Identifiable {

}
