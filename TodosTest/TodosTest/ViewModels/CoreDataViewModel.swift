//
//  CoreDataViewModel.swift
//  TodosTest
//
//  Created by Victoria Samsonova on 22.01.25.
//

import Foundation
import CoreData

class CoreDataViewModel: ObservableObject {
    let container: NSPersistentContainer
    @Published var savedEntities: [ToDoEntity] = []
    @Published var searchText = ""
    
    init() {
        container = NSPersistentContainer(name: "TodosContainer")
        container.loadPersistentStores { (description, error) in
            if let error = error as NSError? {
                print("error loading data: \(error)")
            } else {
                print("successfully loaded data")
            }
        }
        fetchTodos()
    }
    
    func fetchTodos() {
        let req = NSFetchRequest<ToDoEntity>(entityName: "ToDoEntity")
        do {
            savedEntities = try container.viewContext.fetch(req)
        } catch let error {
            print("error fetching. \(error)")
        }
    }
    
    func addTodo(_ todo: String) {
        let newTodo = ToDoEntity(context: container.viewContext)
        newTodo.completed = false
        newTodo.todo = todo
        saveTodo()
    }
    
    func saveTodo() {
        do {
            try container.viewContext.save()
            fetchTodos()
        } catch let error {
            print("error saving. \(error)")
        }
    }
    
//    var searchResults: [ToDoEntity] {
//        if searchText.isEmpty {
//            return savedEntities
//        } else {
//            return savedEntities.filter {
//                $0.title.contains(searchText)
//            }
//        }
//    }
}
