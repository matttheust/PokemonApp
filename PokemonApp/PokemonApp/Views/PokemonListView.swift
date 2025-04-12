//
//  PokemonListView.swift
//  PokemonApp
//
//  Created by Matheus  Torres on 12/04/25.
//


import SwiftUI

struct PokemonListView: View {
    @State private var pokemons: [Pokemon] = []
    
    var body: some View {
        NavigationView {
            List(pokemons) { pokemon in
                NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                    Text(pokemon.name.capitalized)
                }
            }
            .navigationTitle("Pokémons")
            .onAppear {
                PokemonService.shared.fetchPokemons { pokemons in
                    self.pokemons = pokemons ?? []
                }
            }
        }
    }
}