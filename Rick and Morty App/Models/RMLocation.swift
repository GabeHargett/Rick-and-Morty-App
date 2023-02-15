//
//  RMLocation.swift
//  Rick and Morty App
//
//  Created by Tanner Rozier on 2/6/23.
//

import Foundation

struct RMLocation: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}

