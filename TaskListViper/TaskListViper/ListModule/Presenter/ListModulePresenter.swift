//
//  ListModulePresenter.swift
//  TaskListViper
//
//  Created by Victoria Samsonova on 20.01.25.
//

import Foundation

//protocol ListModulePresenterInput: AnyObject {
//    func presentFetchedTodos(_ todos: [ToDoItem])
//    func presentFilteredTodos(_ todos: [ToDoItem])
//}
//
//class ListModulePresenter: ObservableObject, ListModulePresenterInput, ListModuleViewInput {
//    weak var view: ListModuleViewInput?
//    var interactor: ListModuleInteractorInput
//    var router: ListModuleRouterInput
//
//    var todos: [ToDoItem] = [] {
//        didSet {
//            view?.displayTodos(todos)
//        }
//    }
//
//    init(interactor: ListModuleInteractorInput, router: ListModuleRouterInput) {
//        self.interactor = interactor
//        self.router = router
//    }
//
//    func viewDidLoad() {
//        interactor.fetchTodos()
//    }
//
//    func viewSearchTextChanged(_ searchText: String) {
//        interactor.filterTodos(by: searchText)
//    }
//
//    func presentFetchedTodos(_ todos: [ToDoItem]) {
//        DispatchQueue.main.async {
//            self.todos = todos
//        }
//    }
//
//    func presentFilteredTodos(_ todos: [ToDoItem]) {
//        DispatchQueue.main.async {
//            self.todos = todos
//        }
//    }
//
//    func displayTodos(_ todos: [ToDoItem]) {
//        self.todos = todos
//    }
//}
//
//protocol ListModuleViewInput: AnyObject {
//    func displayTodos(_ todos: [ToDoItem])
//}

// MARK: - Presenter
class TodoListPresenter: ObservableObject, TodoListPresenterProtocol, TodoListInteractorOutputProtocol {
    // Зависимости
    private let router: TodoListRouterProtocol
    private let interactor: TodoListInteractorInputProtocol
    
    // Published свойства для SwiftUI
    @Published var todos: [ToDoItem] = []
    @Published var errorMessage: String = ""
    
    init(router: TodoListRouterProtocol, interactor: TodoListInteractorInputProtocol) {
        self.router = router
        self.interactor = interactor
    }
    
    // MARK: Presenter Protocol Methods
    func viewDidLoad() {
        interactor.fetchTodos()
    }
    
    func addTodo(_ todo: ToDoItem) {
        interactor.saveTodo(todo)
        todos.append(todo)
    }
    
    func deleteTodo(_ todo: ToDoItem) {
        interactor.deleteTodo(todo)
        todos.removeAll { $0.id == todo.id }
    }
    
    func selectTodo(_ todo: ToDoItem) -> ItemModuleView {
        router.createDetailView(for: todo)
    }
    
    // MARK: Interactor Output Methods
    func didFetchTodos(_ todos: [ToDoItem]) {
        self.todos = todos
    }
    
    func didFailWithError(_ error: Error) {
        self.errorMessage = error.localizedDescription
    }
}
