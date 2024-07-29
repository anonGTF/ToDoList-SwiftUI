//
//  ToDoItemView.swift
//  ToDoList
//
//  Created by Galih Tegar Febrianto on 26/7/24.
//

import SwiftUI

struct ToDoItemView: View {
    let item: ToDo
    let onToggle: () -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button {
                onToggle()
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

#Preview {
    ToDoItemView(
        item: .init(
            id: "",
            title: "coba",
            dueDate: Date().timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: true
        ),
        onToggle: {}
    )
}
