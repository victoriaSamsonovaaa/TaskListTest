//
//  ListModuleInteractor.swift
//  TaskListViper
//
//  Created by Victoria Samsonova on 20.01.25.
//

import Foundation

//protocol ListModuleInteractorInput {
//    func fetchTodos()
//    func filterTodos(by searchText: String)
//}
//
//class ListModuleInteractor: ListModuleInteractorInput {
//    weak var output: ListModuleInteractorOutput?
//    private let coreDataManager = CoreDataManager.shared
//
//    func fetchTodos() {
//        let url = URL(string: "https://dummyjson.com/todos")!
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data, error == nil else {
//                print("Failed to fetch todos: \(error?.localizedDescription ?? "Unknown error")")
//                return
//            }
//            do {
//                let todoResponse = try JSONDecoder().decode(TodoResponse.self, from: data)
//                self.coreDataManager.saveTodos(todoResponse.todos)
//                let todos = self.coreDataManager.fetchTodos()
//                DispatchQueue.main.async {
//                    self.output?.didFetchTodos(todos)
//                }
//            } catch {
//                print("Failed to decode todos: \(error)")
//            }
//        }.resume()
//    }
//
//    func filterTodos(by searchText: String) {
//        let todos = coreDataManager.fetchTodos()
//        if searchText.isEmpty {
//            output?.didFilterTodos(todos)
//        } else {
//            let filteredTodos = todos.filter { $0.todo.localizedCaseInsensitiveContains(searchText) }
//            output?.didFilterTodos(filteredTodos)
//        }
//    }
//}
//
//protocol ListModuleInteractorOutput: AnyObject {
//    func didFetchTodos(_ todos: [ToDoItem])
//    func didFilterTodos(_ todos: [ToDoItem])
//}

// MARK: - Interactor
class TodoListInteractor: TodoListInteractorInputProtocol {
    weak var presenter: TodoListInteractorOutputProtocol?
    
    // Здесь будет логика работы с API и CoreData
    func fetchTodos() {
        // Временный мок
        let mockTodos = [
            ToDoItem(id: 1, todo: "Do sport", completed: false, userId: 203),
            ToDoItem(id: 2, todo: "Hacer deporte", completed: true, userId: 203)
        ]
        
        // Имитация асинхронной загрузки
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.presenter?.didFetchTodos(mockTodos)
        }
    }
    
    func saveTodo(_ todo: ToDoItem) {
        // Логика сохранения
        print("Saving todo: \(todo.todo)")
    }
    
    func deleteTodo(_ todo: ToDoItem) {
        // Логика удаления
        print("Deleting todo: \(todo.todo)")
    }
}
