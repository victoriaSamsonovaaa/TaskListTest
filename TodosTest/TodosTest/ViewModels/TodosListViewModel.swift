//
//  TodosListViewViewModel.swift
//  TodosTest
//
//  Created by Victoria Samsonova on 22.01.25.
//

import Foundation
import SwiftUI

class TodosListViewModel: ObservableObject {
    
    @Published var savedEntities: [ToDoEntity] = []
    @Published var searchText = ""
    @State private var coreDataViewModel = CoreDataViewModel()
    
    init(coreDataViewModel: CoreDataViewModel) {
        self.coreDataViewModel = coreDataViewModel
        fetchTodos()
    }
    
    func fetchTodos() {
        savedEntities = coreDataViewModel.fetchTodos()
    }
    
    var searchResults: [ToDoEntity] {
        if searchText.isEmpty {
            return savedEntities
        } else {
            return savedEntities.filter {
                $0.todo?.localizedCaseInsensitiveContains(searchText) ?? false
            }
        }
    }
}
