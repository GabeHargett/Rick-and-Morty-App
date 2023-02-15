//
//  RMCharacter.swift
//  Rick and Morty App
//
//  Created by Tanner Rozier on 2/6/23.
//

import Foundation

struct RMCharacter: Codable {
    let id: Int
    let name: String
    let status: RMCharacterStatus
    let species: String
    let type: String
    let gender: RMCharacterGender
    let origin: RMOrigin
    let location: RMSingleLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

struct RMOrigin: Codable{
    let name: String
    let url: String
}

struct RMSingleLocation: Codable {
    let name: String
    let url: String
}

enum RMCharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "unknown"
}

enum RMCharacterGender: String, Codable {
    case male = "Male"
    case female = "Female"
    case genderless = "Genderless"
    case unknown = "unknown"
}
