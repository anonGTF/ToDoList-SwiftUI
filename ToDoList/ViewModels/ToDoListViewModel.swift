//
//  ToDoListViewModel.swift
//  ToDoList
//
//  Created by Galih Tegar Febrianto on 26/7/24.
//

import Foundation
import FirebaseFirestore

class ToDoListViewModel: ObservableObject {
    @Published var showAddItemSheet = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
    
    func toggleDone(item: ToDo) {
        let db = Firestore.firestore()
        var updatedItem = item
        updatedItem.setDone(!item.isDone)
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(item.id)
            .setData(updatedItem.asDictionary())
    }
}
