//
//  AddItemViewModel.swift
//  ToDoList
//
//  Created by Galih Tegar Febrianto on 26/7/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AddItemViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {}
    
    func save(onSaved: () -> Void) {
        guard validate() else {
            showAlert = true
            return
        }
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let newId = UUID().uuidString
        let newToDo = ToDo(
            id: newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(newId)
            .setData(newToDo.asDictionary())
        
        onSaved()
    }
    
    private func validate() -> Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
