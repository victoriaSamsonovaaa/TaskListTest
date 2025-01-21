//
//  ContentView.swift
//  TaskListViper
//
//  Created by Victoria Samsonova on 20.01.25.
//

import SwiftUI

struct ListModuleView: View {
    @ObservedObject var presenter: ListModulePresenter
    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            List(presenter.todos, id: \.id) { todo in
                NavigationLink {
                    ItemModuleView(todo: todo)
                } label: {
                    ToDoRowView(todo: todo)
                }
            }
            .listStyle(.inset)
            .navigationTitle("Tasks")
            .searchable(text: $searchText)
            .onChange(of: searchText) { newValue in
                presenter.viewSearchTextChanged(newValue)
            }
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    Text("\(presenter.todos.count) \(presenter.todos.count == 1 ? "task" : "tasks")")
                        .foregroundStyle(.secondary)
                    Spacer()
                    Button {
                        presenter.router.navigateToAddItemModule()
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }
                }
            }
            
        } 
        .tint(.yellow)
        .onAppear {
            presenter.viewDidLoad()
        }
    }
}

#Preview {
    let interactor = ListModuleInteractor()
    let router = ListModuleRouter()
    let presenter = ListModulePresenter(interactor: interactor, router: router)
    ListModuleView(presenter: presenter)
}
