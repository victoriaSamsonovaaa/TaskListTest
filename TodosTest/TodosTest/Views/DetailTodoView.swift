//
//  DetailTodoView.swift
//  TodosTest
//
//  Created by Victoria Samsonova on 22.01.25.
//

import SwiftUI

struct DetailTodoView: View {
    
    @State private var viewModel = DetailTodoViewModel()
    
    var todo: ToDoEntity
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text(viewModel.todoTitle)
                        .bold()
                        .font(.largeTitle)
                    Text(viewModel.todoCurDate)
                        .foregroundStyle(.secondary)
                        .font(.caption)
                }
                .padding(.horizontal, 6)
                
                TextEditor(text: $viewModel.todoText)
                    .onSubmit {
                        viewModel.saveChanges()
                    }
                
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
