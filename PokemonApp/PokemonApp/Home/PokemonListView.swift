//
//  PokemonListView.swift
//  PokemonApp
//
//  Created by Matheus  Torres on 08/04/25.
//

import SwiftUI

struct PokemonListView: View {
    @State private var pokemons: [PokemonListItem] = []
    @State private var isLoading = false
    @State private var error: Error?
    
    var body: some View {
        NavigationStack {  // Use NavigationStack em vez de NavigationView
            Group {
                if isLoading {
                    ProgressView()
                } else if let error = error {
                    ErrorView(error: error)
                } else {
                    PokemonListContent(pokemons: pokemons)
                }
            }
            .navigationTitle("Pokémon (1-151)")
            .task {
                await loadPokemons()
            }
        }
    }
    
    private func loadPokemons() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            pokemons = try await PokeAPIService.shared.fetchFirst151Pokemon()
        } catch {
            self.error = error
            print("Erro ao carregar Pokémon:", error.localizedDescription)
        }
    }
}

// Subviews para melhor organização
private struct PokemonListContent: View {
    let pokemons: [PokemonListItem]
    
    var body: some View {
        List(pokemons) { pokemon in
            Text(pokemon.name.capitalized)
                .font(.system(size: 16, weight: .medium))
        }
    }
}

private struct ErrorView: View {
    let error: Error
    
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.triangle")
                .font(.largeTitle)
                .foregroundColor(.red)
            Text("Erro ao carregar Pokémon")
                .font(.headline)
            Text(error.localizedDescription)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
    }
}
