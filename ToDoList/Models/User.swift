//
//  User.swift
//  ToDoList
//
//  Created by Galih Tegar Febrianto on 26/7/24.
//

import Foundation

struct User: Codable {
    let id: String
    let username: String
    let email: String
    let joined: TimeInterval
}
