//
//  PokemonDetailView.swift
//  PokemonApp
//
//  Created by Matheus  Torres on 12/04/25.
//


import SwiftUI

struct PokemonDetailView: View {
    let pokemon: Pokemon
    @State private var details: PokemonDetails?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            if let details = details {
                Text(details.name.capitalized)
                    .font(.largeTitle)
                
                Text("Altura: \(details.height)")
                Text("Peso: \(details.weight)")
                
                Text("Tipos:")
                ForEach(details.types, id: \.type.name) { type in
                    Text("- \(type.type.name.capitalized)")
                }
            } else {
                ProgressView()
            }
        }
        .padding()
        .onAppear {
            PokemonService.shared.fetchPokemonDetails(name: pokemon.name) { details in
                self.details = details
            }
        }
    }
}