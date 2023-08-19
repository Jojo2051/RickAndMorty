//
//  Character.swift
//  RickAndMorty
//
//  Created by Alikhan Aghazade on 17.08.23.
//

import Foundation

// MARK: - CharacterData
struct CharacterData: Codable {
    let id: Int
    let name, status, species, type: String
    let gender: String
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let url: String
}
