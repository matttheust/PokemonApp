//
//  PoppinsFont.swift
//  PokemonApp
//
//  Created by Matheus  Torres on 08/04/25.
//
import SwiftUI

enum PoppinsFont {
    // Estilos sem itálico
    case thin
    case extraLight
    case light
    case regular
    case medium
    case semiBold
    case bold
    case extraBold
    case black
    
    // Estilos itálicos
    case thinItalic
    case extraLightItalic
    case lightItalic
    case italic
    case mediumItalic
    case semiBoldItalic
    case boldItalic
    case extraBoldItalic
    case blackItalic
    
    var name: String {
        switch self {
        // Fontes regulares
        case .thin: return "Poppins-Thin"
        case .extraLight: return "Poppins-ExtraLight"
        case .light: return "Poppins-Light"
        case .regular: return "Poppins-Regular"
        case .medium: return "Poppins-Medium"
        case .semiBold: return "Poppins-SemiBold"
        case .bold: return "Poppins-Bold"
        case .extraBold: return "Poppins-ExtraBold"
        case .black: return "Poppins-Black"
            
        // Fontes itálicas
        case .thinItalic: return "Poppins-ThinItalic"
        case .extraLightItalic: return "Poppins-ExtraLightItalic"
        case .lightItalic: return "Poppins-LightItalic"
        case .italic: return "Poppins-Italic"
        case .mediumItalic: return "Poppins-MediumItalic"
        case .semiBoldItalic: return "Poppins-SemiBoldItalic"
        case .boldItalic: return "Poppins-BoldItalic"
        case .extraBoldItalic: return "Poppins-ExtraBoldItalic"
        case .blackItalic: return "Poppins-BlackItalic"
        }
    }
    
    func size(_ size: CGFloat) -> Font {
        Font.custom(name, size: size)
    }
    
    // Método conveniente para uso rápido
    static func poppins(_ style: PoppinsFont, size: CGFloat) -> Font {
        style.size(size)
    }
}

extension Text {
    func poppins(_ style: PoppinsFont, size: CGFloat, color: Color = .black) -> Text {
        self
            .font(style.size(size))
            .foregroundColor(color)
    }
}
