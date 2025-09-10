//
//  DataModel.swift
//  Day60Challenge
//
//  Created by Santhosh Srinivas on 10/09/25.
//

import Foundation

struct Users: Codable{
    let id: String
    var isActive: Bool
    let name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    let registered: String
    let tags: [String]
    var friends: [Friends]
}

struct Friends: Codable{
    let id: String
    let name: String
}
