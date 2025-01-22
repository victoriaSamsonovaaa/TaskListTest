//
//  DetailTodoView.swift
//  TodosTest
//
//  Created by Victoria Samsonova on 22.01.25.
//

import SwiftUI

struct DetailTodoView: View {
    
    @StateObject private var viewModel: DetailTodoViewModel
    
    init(todo: ToDoEntity) {
        _viewModel = StateObject(wrappedValue: DetailTodoViewModel(todoEntity: todo))
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text(viewModel.todoEntity.title)
                        .bold()
                        .font(.largeTitle)
                    Text(viewModel.todoEntity.curDate)
                        .foregroundStyle(.secondary)
                        .font(.caption)
                }
                .padding(.horizontal, 6)
                
                TextEditor(text: Binding(
                    get: { viewModel.todoEntity.todo ?? ""},
                    set: { newValue in
                        viewModel.todoEntity.todo = newValue
                        viewModel.saveChanges()
                    }
                ))
                
                Spacer()
            }
            .onDisappear {
                viewModel.saveChanges() 
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        viewModel.saveChanges()
                    }
                }
            }
            .padding(.leading)
        }

    }
}

//#Preview {
//    DetailTodoView()
//}
