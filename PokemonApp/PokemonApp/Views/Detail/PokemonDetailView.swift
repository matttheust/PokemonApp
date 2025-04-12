//
//  PokemonDetailView.swift
//  PokemonApp
//
//  Created by Matheus  Torres on 12/04/25.
//


import SwiftUI

struct PokemonDetailView: View {
    let pokemon: Pokemon
    @StateObject private var viewModel = PokemonDetailViewModel()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let details = viewModel.details {
                    HeaderView(name: details.name, imageURL: details.sprites.front_default)
                    
                    InfoSection(title: "Informações") {
                        DetailRow(label: "Altura", value: "\(details.height)")
                        DetailRow(label: "Peso", value: "\(details.weight)")
                        DetailRow(label: "Experiência Base", value: "\(details.base_experience)")
                    }

                    InfoSection(title: "Habilidades") {
                        ForEach(details.abilities, id: \.ability.name) {
                            Text("- \($0.ability.name.capitalized)")
                                .padding(.leading, 8)
                        }
                    }

                    InfoSection(title: "Tipos") {
                        HStack {
                            ForEach(details.types, id: \.type.name) {
                                TypeBadge(typeName: $0.type.name)
                            }
                        }
                    }

                    InfoSection(title: "Movimentos") {
                        ForEach(details.moves.prefix(5), id: \.move.name) {
                            Text("- \($0.move.name.capitalized)")
                                .padding(.leading, 8)
                        }
                    }

                    if !details.held_items.isEmpty {
                        InfoSection(title: "Held Items") {
                            ForEach(details.held_items, id: \.item.name) {
                                Text("- \($0.item.name.capitalized)")
                                    .padding(.leading, 8)
                            }
                        }
                    }
                } else {
                    ProgressView()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 40)
                }
            }
            .padding()
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [.white, .gray.opacity(0.2)]),
                           startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
        )
        .onAppear {
            viewModel.fetchDetails(for: pokemon.name)
        }
    }
}
