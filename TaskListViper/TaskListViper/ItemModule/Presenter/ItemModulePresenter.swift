//
//  ItemModulePresenter.swift
//  TaskListViper
//
//  Created by Victoria Samsonova on 20.01.25.
//

import Foundation

// MARK: - Detail Presenter
class ItemDetailPresenter: ObservableObject, ItemDetailPresenterProtocol, ItemDetailInteractorOutputProtocol {
    private let router: ItemDetailRouterProtocol
    private let interactor: ItemDetailInteractorInputProtocol
    
    @Published var todo: ToDoItem
    @Published var errorMessage: String = ""
    
    init(router: ItemDetailRouterProtocol, interactor: ItemDetailInteractorInputProtocol) {
        self.router = router
        self.interactor = interactor
        self.todo = (interactor as? ItemDetailInteractor)?.todo ?? ToDoItem(id: 0, todo: "", completed: false, userId: 0)
    }
    
    func viewDidLoad() {
        interactor.fetchTodoDetails(id: todo.id)
    }
    
    func updateTodo(todo: ToDoItem) {
        interactor.updateTodo(todo)
    }
    
    func deleteTodo() {
        interactor.deleteTodo(todo)
    }
    
    // MARK: Interactor Output Methods
    func didFetchTodoDetails(_ todo: ToDoItem) {
        self.todo = todo
    }
    
    func didUpdateTodo(_ todo: ToDoItem) {
        self.todo = todo
    }
    
    func didDeleteTodo() {
        router.dismissDetailView()
    }
    
    func didFailWithError(_ error: Error) {
        errorMessage = error.localizedDescription
    }
}
