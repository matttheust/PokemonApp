//
//  PokemonService.swift
//  PokemonApp
//
//  Created by Matheus  Torres on 12/04/25.
//

import Foundation

class PokemonService {
    static let shared = PokemonService()
    private let baseURL = "https://pokeapi.co/api/v2/pokemon"
    
    func fetchPokemons(completion: @escaping ([Pokemon]?) -> Void) {
        guard let url = URL(string: "\(baseURL)?limit=151") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data,
                  let response = try? JSONDecoder().decode(PokemonListResponse.self, from: data) else {
                completion(nil)
                return
            }
            completion(response.results)
        }.resume()
    }
    
    func fetchPokemonDetails(name: String, completion: @escaping (PokemonDetails?) -> Void) {
        guard let url = URL(string: "\(baseURL)/\(name)") else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }

            do {
                let decoder = JSONDecoder()
                let details = try decoder.decode(PokemonDetails.self, from: data)
                completion(details)
            } catch {
                print("Erro ao decodificar JSON: \(error)")
                completion(nil)
            }
        }.resume()
    }

}
