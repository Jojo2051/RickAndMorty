//
//  OriginData.swift
//  RickAndMorty
//
//  Created by Alikhan Aghazade on 19.08.23.
//

import Foundation

// MARK: - OriginData
struct OriginData: Codable {
    let id: Int
    let name, type, dimension: String
    let residents: [String]
    let url: String
    let created: String
}
