//
//  TodosTestApp.swift
//  TodosTest
//
//  Created by Victoria Samsonova on 22.01.25.
//

import SwiftUI
import SwiftData

@main
struct TodosTestApp: App {
    
    var body: some Scene {
        WindowGroup {
            TodosListView()
                .environment(\.managedObjectContext, CoreDataManager.shared.viewContext)
        }
    }
}
