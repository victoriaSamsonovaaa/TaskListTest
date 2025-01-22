//
//  CoreDataManager.swift
//  TodosTest
//
//  Created by Victoria Samsonova on 22.01.25.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    let persistentContainer: NSPersistentContainer
    var searchText: String = ""
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "TodosModel")
        
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                print("error loading data: \(error.localizedDescription)")
            }
        }
    }
    
    var searchResults: [ToDoEntity] {
        if searchText.isEmpty {
            return getAllTodos()
        } else {
            return getAllTodos().filter {
                $0.title.contains(searchText)
            }
        }
    }
    
    func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                viewContext.rollback()
                print(error.localizedDescription)
            }
        }
    }
    
    func getMaxId() -> Int16 {
        let request: NSFetchRequest<ToDoEntity> = ToDoEntity.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "id", ascending: false)]
        request.fetchLimit = 1

        do {
            if let maxId = try viewContext.fetch(request).first?.id {
                return maxId
            }
        } catch {
            print("error")
        }
        
        return 0  
    }
    
    
    func getAllTodos() -> [ToDoEntity] {
        let request = NSFetchRequest<ToDoEntity>(entityName: "ToDoEntity")
        do {
            return try viewContext.fetch(request)
        } catch let error {
            print("error fetching: \(error)")
            return []
        }
    }
    

    func addTodo(todo: String) {
        let newTodo = ToDoEntity(context: viewContext)
        newTodo.completed = false
        newTodo.todo = todo
        newTodo.createdAt = Date()
        newTodo.id = getMaxId() + 1
        saveContext()
    }

    func deleteTodo(todo: ToDoEntity) {
        viewContext.delete(todo)
        saveContext()
    }
    
}
