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
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let details = details {
                    // Header com nome e imagem
                    HStack {
                        Text(details.name.capitalized)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                        Spacer()
                        AsyncImage(url: URL(string: details.sprites.front_default ?? "")) { image in
                            image.resizable().scaledToFit()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 100, height: 100)
                    }
                    .padding(.bottom, 8)

                    // Informações básicas
                    SectionTitle(title: "Informações")
                    DetailRow(label: "Altura", value: "\(details.height)")
                    DetailRow(label: "Peso", value: "\(details.weight)")
                    DetailRow(label: "Experiência Base", value: "\(details.base_experience)")

                    // Habilidades
                    SectionTitle(title: "Habilidades")
                    ForEach(details.abilities, id: \.ability.name) { ability in
                        Text("- \(ability.ability.name.capitalized)")
                            .padding(.leading, 8)
                    }

                    // Tipos
                    SectionTitle(title: "Tipos")
                    HStack {
                        ForEach(details.types, id: \.type.name) { type in
                            TypeBadge(typeName: type.type.name)
                        }
                    }

                    // Movimentos
                    SectionTitle(title: "Movimentos")
                    ForEach(details.moves.prefix(5), id: \.move.name) { move in // Exibe apenas os 5 primeiros
                        Text("- \(move.move.name.capitalized)")
                            .padding(.leading, 8)
                    }

                    // Held Items
                    SectionTitle(title: "Held Items")
                    ForEach(details.held_items, id: \.item.name) { item in
                        Text("- \(item.item.name.capitalized)")
                            .padding(.leading, 8)
                    }

                } else {
                    ProgressView()
                }
            }
            .padding()
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [.white, .gray.opacity(0.3)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
        )
        .onAppear {
            PokemonService.shared.fetchPokemonDetails(name: pokemon.name) { details in
                self.details = details
            }
        }
    }
}

// Componentes reutilizáveis para melhor organização e estilo
struct SectionTitle: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .padding(.top, 16)
            .foregroundColor(.black)
    }
}

struct DetailRow: View {
    let label: String
    let value: String

    var body: some View {
        HStack {
            Text("\(label):")
                .fontWeight(.bold)
            Text(value)
        }
        .padding(.leading, 8)
    }
}

struct TypeBadge: View {
    let typeName: String

    var body: some View {
        Text(typeName.capitalized)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)
    }
}

