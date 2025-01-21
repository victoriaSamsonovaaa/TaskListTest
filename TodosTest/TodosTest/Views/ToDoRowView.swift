//
//  ToDoRowView.swift
//  TaskListViper
//
//  Created by Victoria Samsonova on 20.01.25.
//

import SwiftUI

struct ToDoRowView: View {
    
    var todo: ToDoEntity
    
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: todo.completed ? "checkmark.circle" : "circle")
                .padding(.top, 4)
                .foregroundStyle(todo.completed ? .yellow : .secondary)
            VStack(alignment: .leading) {
               // Text(todo.title)
               //     .font(.title2)
                //    .strikethrough(todo.completed, color: .secondary)
                Text(todo.todo!)
                    .font(.body)
                //Text(todo.curDate)
                //    .font(.body)
                  //  .foregroundStyle(.secondary)
            }
            .foregroundStyle(todo.completed ? .secondary : .primary)
        }
    }
}
