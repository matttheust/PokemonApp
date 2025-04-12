//
//  Pokemon.swift
//  PokemonApp
//
//  Created by Matheus  Torres on 12/04/25.
//


import Foundation

struct Pokemon: Codable, Identifiable {
    let name: String
    let url: String
    var id: String { name } // Usamos o nome como ID
}

struct PokemonListResponse: Codable {
    let results: [Pokemon]
}

struct PokemonDetails: Codable {
    let name: String
    let height: Int
    let weight: Int
    let types: [PokemonType]
    
    struct PokemonType: Codable {
        let type: TypeDetail
        
        struct TypeDetail: Codable {
            let name: String
        }
    }
}