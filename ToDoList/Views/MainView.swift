//
//  MainView.swift
//  ToDoList
//
//  Created by Galih Tegar Febrianto on 26/7/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            content
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var content: some View {
        TabView {
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainView()
}
