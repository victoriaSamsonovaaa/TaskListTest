//
//  AddItemModuleView.swift
//  TaskListViper
//
//  Created by Victoria Samsonova on 21.01.25.
//

import SwiftUI

struct AddItemModuleView: View {
    @Environment(\.dismiss) private var dismiss
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
            .padding()
        }
    }
}




#Preview {
    AddItemModuleView()
}
