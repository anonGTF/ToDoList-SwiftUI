//
//  AddItemView.swift
//  ToDoList
//
//  Created by Galih Tegar Febrianto on 26/7/24.
//

import SwiftUI

struct AddItemView: View {
    @StateObject var viewModel = AddItemViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            
            Form {
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                DatePicker("Due date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                TLButton(
                    title: "Save",
                    background: .pink
                ) {
                    viewModel.save {
                        newItemPresented = false
                    }
                }
                .padding()
                .alert(isPresented: $viewModel.showAlert) {
                    Alert(
                        title: Text("Error"),
                        message: Text("Please fill all fields and select due date newer than yesterday")
                    )
                }
            }
        }
    }
}

#Preview {
    AddItemView(newItemPresented: Binding(get: { return true }, set: { _ in }))
}
