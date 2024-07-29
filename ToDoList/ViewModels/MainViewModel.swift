//
//  MainViewModel.swift
//  ToDoList
//
//  Created by Galih Tegar Febrianto on 26/7/24.
//

import Foundation
import FirebaseAuth

class MainViewModel : ObservableObject {
    @Published var currentUserId = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn = Auth.auth().currentUser != nil
}
