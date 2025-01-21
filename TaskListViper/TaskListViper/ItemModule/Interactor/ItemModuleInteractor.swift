//
//  ItemModuleInteractor.swift
//  TaskListViper
//
//  Created by Victoria Samsonova on 20.01.25.
//

import Foundation

// MARK: - Detail Interactor
class ItemDetailInteractor: ItemDetailInteractorInputProtocol {
    weak var presenter: ItemDetailInteractorOutputProtocol?
    private var todo: ToDoItem
    
    init(todo: ToDoItem) {
        self.todo = todo
    }
    
    func fetchTodoDetails(id: Int16) {
        // Здесь будет логика загрузки детальной информации
        // Временно просто возвращаем текущий todo
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.presenter?.didFetchTodoDetails(self.todo)
        }
    }
    
    func updateTodo(_ todo: ToDoItem) {
        // Логика обновления todo
        self.todo = todo
        presenter?.didUpdateTodo(todo)
    }
    
    func deleteTodo(_ todo: ToDoItem) {
        // Логика удаления todo
        presenter?.didDeleteTodo()
    }
}
