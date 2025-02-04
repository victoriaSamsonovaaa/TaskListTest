//
//  TodoDataService.swift
//  TodosTest
//
//  Created by Victoria Samsonova on 22.01.25.
//

import Foundation

class TodoDataService {
    
    @Published var todos: [Todo] = []
    
    func fetchFromApi() {
        guard let url = URL(string: "https://dummyjson.com/todos") else { return }
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self, let data = data, error == nil else {
                print("failed to fetch \(error?.localizedDescription ?? "idk")")
                return
            }
            do {
                let todoResponse = try JSONDecoder().decode(TodoResponse.self, from: data)
                DispatchQueue.main.async {
                    self.saveToCoreData(todos: todoResponse.todos)
                    self.loadFromCoreData()
                }
            }
            catch {
                print("failed to decode todos: \(error)")
            }
        }
        .resume()
    }
    
    private func saveToCoreData(todos: [Todo]) {
        todos.forEach { todo in
            let todoEntity = ToDoEntity(context: CoreDataManager.shared.viewContext)
            todoEntity.id = todo.id
            todoEntity.userId = todo.userId
            todoEntity.completed = todo.completed
            todoEntity.todo = todo.todo
            todoEntity.createdAt = Date()
        }
        
        CoreDataManager.shared.saveContext()
    }
        
    private func loadFromCoreData() {
        let coreDataTodos = CoreDataManager.shared.getAllTodos()
        todos = coreDataTodos.map { ent in
            Todo(id: ent.id, userId: ent.userId, completed: ent.completed, todo: ent.todo)
        }
    }
}


