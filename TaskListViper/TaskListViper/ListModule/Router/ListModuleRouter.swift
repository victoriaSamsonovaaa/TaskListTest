//
//  ListModulePresenter.swift
//  TaskListViper
//
//  Created by Victoria Samsonova on 20.01.25.
//

import Foundation
import SwiftUI

//protocol ListModuleRouterInput {
//    func navigateToAddItemModule()
//    func navigateToItemModule(todo: ToDoItem)
//}
//
//class ListModuleRouter: ListModuleRouterInput, ObservableObject {
//    @Published var navigateToAddItem = false
//    @Published var navigateToItem: ToDoItem? = nil
//
//    func navigateToAddItemModule() {
//        navigateToAddItem = true
//    }
//
//    func navigateToItemModule(todo: ToDoItem) {
//        navigateToItem = todo
//    }
//
//    func resetNavigation() {
//        navigateToAddItem = false
//        navigateToItem = nil
//    }
//}

// MARK: - Router
class TodoListRouter: TodoListRouterProtocol {
    func createDetailView(for todo: ToDoItem) -> ItemModuleView {
        // Создание детального вью для конкретной задачи
        ItemModuleView(todo: todo)
    }
    
    // Метод создания модуля
    static func createModule() -> ListModuleView {
        let router = TodoListRouter()
        let interactor = TodoListInteractor()
        let presenter = TodoListPresenter(
            router: router,
            interactor: interactor
        )
        interactor.presenter = presenter
        
        return ListModuleView(presenter: presenter)
    }
}
