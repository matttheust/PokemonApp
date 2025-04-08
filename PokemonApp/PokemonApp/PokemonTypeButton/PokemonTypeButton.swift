//
//  PokemonTypeButton.swift
//  PokemonApp
//
//  Created by Matheus  Torres on 08/04/25.
//

import SwiftUI

//Botoes Longos

struct PokemonTypeButton: View {
    let type: PokemonType
    var action: (() -> Void)? = nil
    
    var body: some View {
        Button(action: {
            action?()
        }) {
            ZStack {
                Text(type.displayName)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                HStack {
                    Spacer()
                    Image(systemName: "chevron.down")
                        .foregroundColor(.black)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity) // ocupa toda a largura
            .background(type.color)
            .cornerRadius(25)
        }
    }
}


//let types: [PokemonType]
//
//var body: some View {
//    ScrollView(.vertical, showsIndicators: false) {
//        VStack(alignment: .leading, spacing: 24) {
//            
//            Text("Botões Alongados")
//                .font(.headline)
//                .foregroundColor(.white)
//                .padding(.horizontal)
//            
//            VStack(spacing: 12) {
//                ForEach(types) { type in
//                    PokemonTypeButton(type: type) {
//                        print("Selecionado (1): \(type.displayName)")
//                    }
//                }
//            }
//            .padding(.horizontal)
//            
//            Text("Botões Curtos")
//                .font(.headline)
//                .foregroundColor(.white)
//                .padding(.horizontal)
//            
//            VStack(spacing: 12) {
//                ForEach(types) { type in
//                    PokemonTypeButton2(type: type) {
//                        print("Selecionado (2): \(type.displayName)")
//                    }
//                }
//            }
//            .padding(.horizontal)
//        }
//        .padding(.vertical)
//    }
//    .background(Color.black.ignoresSafeArea())
//}
