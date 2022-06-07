//
//  User.swift
//  FriendFace
//
//  Created by Sara Diaz Perez on 19/5/22.
//

import SwiftUI
import Combine

struct User: Codable, Identifiable {
    let id: UUID
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: String
    let friends: [Friend]
}

struct Friend: Codable, Hashable {
    let name: String
    let id: UUID
}
