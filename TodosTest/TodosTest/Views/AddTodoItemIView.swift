//
//  AddTodoItemIView.swift
//  TodosTest
//
//  Created by Victoria Samsonova on 22.01.25.
//

import SwiftUI

struct AddTodoItemView: View {
    @StateObject private var viewModel: DetailTodoViewModel
    
    @State private var newTodo: String = ""
    @State private var curDate: Date = Date()

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("Новое занятие")
                        .bold()
                        .font(.largeTitle)
                    Text(curDate, style: .date)
                        .foregroundStyle(.secondary)
                        .font(.caption)
                }
                .padding(.horizontal, 6)
                TextEditor(text: $newTodo)
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
            .padding()
        }
    }
}

//
//
//
//#Preview {
//    AddTodoItemView()
//}
