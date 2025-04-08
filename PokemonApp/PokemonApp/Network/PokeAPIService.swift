//
//  PokeAPIService.swift
//  PokemonApp
//
//  Created by Matheus  Torres on 08/04/25.
//

import Foundation

class PokeAPIService {
    static let shared = PokeAPIService()
    private let baseURL = "https://pokeapi.co/api/v2"
    
    func fetchFirst151Pokemon() async throws -> [PokemonListItem] {
        let endpoint = "\(baseURL)/pokemon?limit=151"
        guard let url = URL(string: endpoint) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        return try decoder.decode(PokemonListResponse.self, from: data).results
    }
}
