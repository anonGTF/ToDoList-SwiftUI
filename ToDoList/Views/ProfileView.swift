//
//  ProfileView.swift
//  ToDoList
//
//  Created by Galih Tegar Febrianto on 26/7/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    userProfile(user: user)
                } else {
                    Text("Loading profile...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func userProfile(user: User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .frame(width: 124, height: 125)
            .padding()
        
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ")
                Text(user.username)
            }
            .padding()
            
            HStack {
                Text("Email: ")
                Text(user.email)
            }
            .padding()
            
            HStack {
                Text("Member Since: ")
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        }
        
        Button("Log Out") {
            viewModel.logout()
        }
        .tint(.red)
        .padding()
        
        Spacer()
    }
}

#Preview {
    ProfileView()
}
