//
//  AddTodoItemIView.swift
//  TodosTest
//
//  Created by Victoria Samsonova on 22.01.25.
//

import SwiftUI

struct AddTodoItemView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = AddTodoItemViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("New task")
                        .bold()
                        .font(.largeTitle)
                    Text(viewModel.curDate, style: .date)
                        .foregroundStyle(.secondary)
                        .font(.caption)
                }
                .padding(.horizontal, 6)
                TextEditor(text: $viewModel.newTodoText)
                Spacer()
            }
            .onDisappear {
                viewModel.addNewTodo()
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    if !viewModel.newTodoText.isEmpty {
                        Button("Save") {
                            viewModel.addNewTodo()
                            dismiss()
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddTodoItemView()
}
