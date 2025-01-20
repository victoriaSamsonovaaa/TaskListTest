//
//  ItemModuleView.swift
//  TaskListViper
//
//  Created by Victoria Samsonova on 20.01.25.
//

import SwiftUI

struct ItemModuleView: View {
    
    @State private var todo = ToDoItem(id: 4, todo: "Сделать зарядку или сделать тренировку дома", completed: false, userId: 203)
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(todo.title)
                .font(.largeTitle)
            Text(todo.todo)
                .font(.body)
                .foregroundStyle(.secondary)
                    
        }
    }
}

#Preview {
    ItemModuleView()
}
//(id: 4, todo: "Сделать зарядку или сделать тренировку дома", completed: false, userId: 203)
