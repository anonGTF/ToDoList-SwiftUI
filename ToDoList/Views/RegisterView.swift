//
//  RegisterView.swift
//  ToDoList
//
//  Created by Galih Tegar Febrianto on 26/7/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
        VStack {
            HeaderView(title: "Register",
                       subtitle: "Start organizing todo",
                       angle: -15,
                       background: .orange)
            
            Form {
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                }
                
                TextField("Enter your username", text: $viewModel.username)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Enter email address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .autocorrectionDisabled()
                
                SecureField("Enter password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(
                    title: "Create Account",
                    background: .green
                ) {
                    viewModel.register()
                }
                .padding()
            }
            .offset(y: -30)
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
