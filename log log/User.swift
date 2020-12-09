//
//  User.swift
//  log log
//
//  Created by apple on 12/8/20.
//

import Foundation

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUserData() -> User {
        User (
            login: "User",
            password: "Pass",
            person: Person (name: "Sergey", surname: "Druzhinin")
        )
    }
}

struct Person {
    let name: String
    let surname: String
    var fullName: String {
        "\(name) \(surname)"
    }
}
