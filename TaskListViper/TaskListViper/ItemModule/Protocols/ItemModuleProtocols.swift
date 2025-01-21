//
//  ItemModuleProtocols.swift
//  TaskListViper
//
//  Created by Victoria Samsonova on 21.01.25.
//

import Foundation

// MARK: - Detail View Protocols
protocol ItemDetailViewProtocol: AnyObject {
    func updateTodoDetails(_ todo: ToDoItem)
    func showError(_ message: String)
}

protocol ItemDetailPresenterProtocol {
    func viewDidLoad()
    func updateTodo(todo: ToDoItem)
    func deleteTodo()
}

protocol ItemDetailInteractorInputProtocol {
    func fetchTodoDetails(id: Int16)
    func updateTodo(_ todo: ToDoItem)
    func deleteTodo(_ todo: ToDoItem)
}

protocol ItemDetailInteractorOutputProtocol: AnyObject {
    func didFetchTodoDetails(_ todo: ToDoItem)
    func didUpdateTodo(_ todo: ToDoItem)
    func didDeleteTodo()
    func didFailWithError(_ error: Error)
}

protocol ItemDetailRouterProtocol {
    func dismissDetailView()
}
