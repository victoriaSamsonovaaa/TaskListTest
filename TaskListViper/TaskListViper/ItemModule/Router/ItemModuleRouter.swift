//
//  ItemModuleRouter.swift
//  TaskListViper
//
//  Created by Victoria Samsonova on 20.01.25.
//

import Foundation

// MARK: - Detail Router
class ItemDetailRouter: ItemDetailRouterProtocol {
    private weak var viewController: ItemModuleView?
    
    init(viewController: ItemModuleView) {
        self.viewController = viewController
    }
    
    func dismissDetailView() {
        // Логика закрытия вью
    }
    
    static func createModule(with todo: ToDoItem) -> ItemModuleView {
        let view = ItemModuleView(todo: todo)
        let router = ItemDetailRouter(viewController: view)
        let interactor = ItemDetailInteractor(todo: todo)
        let presenter = ItemDetailPresenter(
            router: router,
            interactor: interactor
        )
        
        interactor.presenter = presenter
        
        return view
    }
}
