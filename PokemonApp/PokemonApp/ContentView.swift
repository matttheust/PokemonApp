//
//  ContentView.swift
//  PokemonApp
//
//  Created by Matheus  Torres on 08/04/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Pokémon GO")
                .poppins(.bold, size: 24)
            
            Text("Catch them all")
                .poppins(.regular, size: 16, color: .red)
            
        }
    }
}

#Preview {
    ContentView()
}
