//
//  EpisodeData.swift
//  RickAndMorty
//
//  Created by Alikhan Aghazade on 19.08.23.
//

import Foundation

// MARK: - EpisodeData
struct EpisodeData: Codable {
    let id: Int
    let name, airDate, episode: String
    let characters: [String]
    let url: String
    let created: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
}
