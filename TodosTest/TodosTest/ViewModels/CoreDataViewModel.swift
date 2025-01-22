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
        container = NSPersistentContainer(name: "TodosModel")
        container.loadPersistentStores { (description, error) in
            if let error = error as NSError? {
                print("error loading data: \(error.localizedDescription)")
            } else {
                print("successfully loaded data")
            }
        }
        savedEntities = fetchTodos()
    }
    
    /*     func fetchTodos() {
     let url = URL(string: "https://dummyjson.com/todos")!
     URLSession.shared.dataTask(with: url) { data, response, error in
         guard let data = data, error == nil else {
             print("Failed to fetch todos: \(error?.localizedDescription ?? "Unknown error")")
             return
         }
         do {
             let todoResponse = try JSONDecoder().decode(TodoResponse.self, from: data)
             self.coreDataManager.saveTodos(todoResponse.todos)
             let todos = self.coreDataManager.fetchTodos()
             DispatchQueue.main.async {
                 self.output?.didFetchTodos(todos)
             }
         } catch {
             print("Failed to decode todos: \(error)")
         }
     }.resume()
 }*/
    
    func fetchTodos() -> [ToDoEntity] {
        let request = NSFetchRequest<ToDoEntity>(entityName: "ToDoEntity")
        do {
            return try container.viewContext.fetch(request)
        } catch let error {
            print("error fetching: \(error)")
            return []
        }
    }
    
    func addTodo(_ todo: String) {
        let newTodo = ToDoEntity(context: container.viewContext)
        newTodo.completed = false
        newTodo.todo = todo
        newTodo.createdAt = Date()
        newTodo.id = Int16(Date().timeIntervalSince1970)
        saveTodo()
    }
    
    func updateTodo(_ todo: ToDoEntity, id: Int16? = nil, userId: Int16? = nil, todoText: String? = nil, completed: Bool? = nil, createdAt: Date? = nil) {
        if let id = id {
            todo.id = id
        }
        if let userId = userId {
            todo.userId = userId
        }
        if let todoText = todoText {
            todo.todo = todoText
        }
        if let completed = completed {
            todo.completed = completed
        }
        if let createdAt = createdAt {
            todo.createdAt = createdAt
        }
        saveTodo()
    }

    
    func saveTodo() {
        do {
            try container.viewContext.save()
            savedEntities = fetchTodos()
        } catch let error {
            print("error saving. \(error)")
        }
    }
    
    func deleteTodo(_ todo: ToDoEntity) {
        container.viewContext.delete(todo)
        saveTodo()
    }
    
    var searchResults: [ToDoEntity] {
        if searchText.isEmpty {
            return savedEntities
        } else {
            return savedEntities.filter {
                $0.title.contains(searchText)
            }
        }
    }
}
