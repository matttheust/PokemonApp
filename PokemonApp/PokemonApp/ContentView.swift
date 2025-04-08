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
                    Text("Poppins Regular")
                        .font(.custom("Poppins-Regular", size: 20))
                    Text("Poppins Bold")
                        .font(.custom("Poppins-Bold", size: 20))
                    Text("Poppins Italic")
                        .font(.custom("Poppins-Italic", size: 20))
                }
    }
}

#Preview {
    ContentView()
}
