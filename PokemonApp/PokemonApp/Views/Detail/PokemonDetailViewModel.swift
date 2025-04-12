//
//  PokemonDetailViewModel.swift
//  PokemonApp
//
//  Created by Matheus  Torres on 12/04/25.
//

import SwiftUI

final class PokemonDetailViewModel: ObservableObject {
    @Published var details: PokemonDetails?

    func fetchDetails(for name: String) {
        PokemonService.shared.fetchPokemonDetails(name: name) { [weak self] details in
            DispatchQueue.main.async {
                self?.details = details
            }
        }
    }
}
