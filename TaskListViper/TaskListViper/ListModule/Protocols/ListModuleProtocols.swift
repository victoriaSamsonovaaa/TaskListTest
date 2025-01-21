//
//  ListModuleProtocols.swift
//  TaskListViper
//
//  Created by Victoria Samsonova on 21.01.25.
//

import Foundation

// View Protocol
protocol TodoListViewProtocol: AnyObject {
    func updateTodos(_ todos: [ToDoItem])
    func showError(_ message: String)
}

// Presenter Protocol
protocol TodoListPresenterProtocol {
    func viewDidLoad()
    func addTodo(_ todo: ToDoItem)
    func deleteTodo(_ todo: ToDoItem)
    func selectTodo(_ todo: ToDoItem) -> ItemModuleView
}

// Interactor Input Protocol
protocol TodoListInteractorInputProtocol {
    func fetchTodos()
    func saveTodo(_ todo: ToDoItem)
    func deleteTodo(_ todo: ToDoItem)
}

// Interactor Output Protocol
protocol TodoListInteractorOutputProtocol: AnyObject {
    func didFetchTodos(_ todos: [ToDoItem])
    func didFailWithError(_ error: Error)
}

// Router Protocol
protocol TodoListRouterProtocol {
    func createDetailView(for todo: ToDoItem) -> ItemModuleView
}

