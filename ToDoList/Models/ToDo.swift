//
//  ToDo.swift
//  ToDoList
//
//  Created by Galih Tegar Febrianto on 26/7/24.
//

import Foundation

struct ToDo: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
