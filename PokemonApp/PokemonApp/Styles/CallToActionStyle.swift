//
//  CallToActionStyle.swift
//  PokemonApp
//
//  Created by Matheus  Torres on 08/04/25.
//

import SwiftUI

enum CallToActionStyle {
    case filled    // Botão preenchido
    case outlined  // Botão vazio (borda)
    case secondary // Botão secundário
    
    var backgroundColor: Color {
        switch self {
        case .filled: return Color(hex: "173EA5")
        case .outlined: return .clear
        case .secondary: return Color(hex: "F3F4F6") // cinza/100
        }
    }
    
    var textColor: Color {
            switch self {
            case .filled: return Color(hex: "FFFFFF") 
            case .outlined: return Color(hex: "173EA5")
            case .secondary: return Color(hex: "9CA3AF")
            }
        }
    
    var borderColor: Color {
        switch self {
        case .outlined: return Color(hex: "173EA5")
        default: return .clear
        }
    }
    
    var borderWidth: CGFloat {
        self == .outlined ? 1.5 : 0
    }
}
