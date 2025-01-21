//
//  TaskListViperApp.swift
//  TaskListViper
//
//  Created by Victoria Samsonova on 20.01.25.
//

import SwiftUI
import CoreData

@main
struct TaskListViperApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            let interactor = ListModuleInteractor()
            let router = ListModuleRouter()
            let presenter = ListModulePresenter(interactor: interactor, router: router)
            ListModuleView(presenter: presenter)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

class PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    private init() {
        container = NSPersistentContainer(name: "ItemModel.xcdatamodeld")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unresolved error \(error)")
            }
        }
    }
}
