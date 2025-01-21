//
//  ItemModuleView.swift
//  TaskListViper
//
//  Created by Victoria Samsonova on 20.01.25.
//

import SwiftUI

struct ItemModuleView: View {
    
    var todo: ToDoItem
    @State private var newTodo = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text(todo.title)
                        .bold()
                        .font(.largeTitle)
                    Text(todo.curDate)
                        .foregroundStyle(.secondary)
                        .font(.caption)
                }
                .padding(.horizontal, 6)
                TextEditor(text: $newTodo)
                Spacer()
            }
            .onAppear {
                self.newTodo = todo.todo
            }
            .padding(.leading)
        }

    }
}

#Preview {
    ItemModuleView(todo: ToDoItem(id: 4, todo: "Сделать зарядку или сделать тренировку дома", completed: false, userId: 203))
}
