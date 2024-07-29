//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Galih Tegar Febrianto on 26/7/24.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
