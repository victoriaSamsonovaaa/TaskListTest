//
//  Item.swift
//  TaskListViper
//
//  Created by Victoria Samsonova on 21.01.25.
//

import CoreData

@objc(ItemModel)
public class ItemModel: NSManagedObject, Identifiable {
    @NSManaged public var id: Int16
    @NSManaged public var todo: String?
    @NSManaged public var completed: Bool
    @NSManaged public var userId: Int16
}

extension ItemModel {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemModel> {
        return NSFetchRequest<ItemModel>(entityName: "Item")
    }
}
