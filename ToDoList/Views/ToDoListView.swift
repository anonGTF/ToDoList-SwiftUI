//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Galih Tegar Febrianto on 26/7/24.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewModel
    @FirestoreQuery var items: [ToDo]
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoItemView(item: item) {
                        viewModel.toggleDone(item: item)
                    }
                    .swipeActions {
                        Button("Delete") {
                            viewModel.delete(id: item.id)
                        }
                        .tint(.red)
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showAddItemSheet = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showAddItemSheet) {
                AddItemView(newItemPresented: $viewModel.showAddItemSheet)
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "TbhnsBRwW7SoRSpFxpYqPop54Wh1")
}
