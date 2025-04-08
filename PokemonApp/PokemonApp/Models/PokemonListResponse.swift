//
//  PokemonListResponse.swift
//  PokemonApp
//
//  Created by Matheus  Torres on 08/04/25.
//

import Foundation

struct PokemonListResponse: Codable {
    let results: [PokemonListItem]
}

struct PokemonListItem: Codable, Identifiable {
    let name: String
    let url: String
    var id: Int {
        Int(url.split(separator: "/").last ?? "0") ?? 0
    }
}
