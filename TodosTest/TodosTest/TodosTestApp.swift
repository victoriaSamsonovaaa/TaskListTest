//
//  TodosTestApp.swift
//  TodosTest
//
//  Created by Victoria Samsonova on 22.01.25.
//

import SwiftUI

@main
struct TodosTestApp: App {
    
    @StateObject private var coreDataViewModel = CoreDataViewModel()
    
    var body: some Scene {
        WindowGroup {
            TodosListView()
                .environmentObject(coreDataViewModel)
        }
    }
}
