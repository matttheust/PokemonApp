//
//  ContentView.swift
//  PokemonApp
//
//  Created by Matheus  Torres on 08/04/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            VStack(spacing: 20) {
                // Botão Filled (primário)
                CTAButton(
                    title: "Confirmar Compra",
                    style: .filled,
                    action: {}
                )
                .foregroundColor(.white) // Força a cor branca
                
                // Botão Outlined (vazio)
                CTAButton(
                    title: "Cancelar",
                    style: .outlined,
                    action: { print("Botão outlined pressionado") }
                )
                
                // Botão Secondary
                CTAButton(
                    title: "Voltar",
                    style: .secondary,
                    action: { print("Botão secondary pressionado") }
                )
            }
            .padding()
        }
}

#Preview {
    ContentView()
}
