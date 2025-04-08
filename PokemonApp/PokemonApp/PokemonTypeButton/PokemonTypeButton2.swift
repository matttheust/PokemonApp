//
//  PokemonTypeButton2.swift
//  PokemonApp
//
//  Created by Matheus  Torres on 08/04/25.
//

import SwiftUI

//Botoes Curtos

struct PokemonTypeButton2: View {
    let type: PokemonType
    var action: (() -> Void)? = nil
    
    var body: some View {
        Button(action: {
            action?()
        }) {
            HStack(spacing: 8) {
                Text(type.displayName)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Image(systemName: "chevron.down")
                    .foregroundColor(.black)
            }
            .padding(8)
            .frame(width: 180) 
            .background(type.color)
            .cornerRadius(25)
        }
    }
}
