//
//  CTAButton.swift
//  PokemonApp
//
//  Created by Matheus  Torres on 08/04/25.
//

import SwiftUI

struct CTAButton: View {
    let title: String
    let style: CallToActionStyle
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .poppins(.medium, size: 16)
                .frame(maxWidth: .infinity, minHeight: 52)
                .foregroundColor(style.textColor)
                .background(style.backgroundColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(style.borderColor, lineWidth: style.borderWidth)
                )
                .cornerRadius(12)
                .contentShape(Rectangle())
        }
        .buttonStyle(ScaleButtonStyle())
    }
}

// Efeito de pressão personalizado
struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
