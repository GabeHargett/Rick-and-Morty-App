//
//  RMEpisode.swift
//  Rick and Morty App
//
//  Created by Tanner Rozier on 2/6/23.
//

import Foundation

struct RMEpisode: Codable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}
