//
//  PokemonType.swift
//  PokemonApp
//
//  Created by Matheus  Torres on 08/04/25.
//

import SwiftUI

enum PokemonType: String, CaseIterable, Identifiable {
    case todos = "todos"
    case agua
    case dragao
    case eletrico
    case fada
    case fantasma
    case fogo
    case gelo
    case grama
    case inseto
    case lutador
    case normal
    case noturno
    case metal
    case pedra
    case psiquico
    case terrestre
    case venenoso
    case voador
    
    var id: String { self.rawValue }
    
    var color: Color {
        switch self {
        case .todos:     return Color(hex: "333333")
        case .agua:      return Color(hex: "5090D6")
        case .dragao:    return Color(hex: "0B6DC3")
        case .eletrico:  return Color(hex: "F4D23C")
        case .fada:      return Color(hex: "EC8FE6")
        case .fantasma:  return Color(hex: "5269AD")
        case .fogo:      return Color(hex: "FF9D55")
        case .gelo:      return Color(hex: "73CEC0")
        case .grama:     return Color(hex: "63BC5A")
        case .inseto:    return Color(hex: "91C12F")
        case .lutador:   return Color(hex: "CE416B")
        case .normal:    return Color(hex: "919AA2")
        case .noturno:   return Color(hex: "5A5465")
        case .metal:     return Color(hex: "5A8EA2")
        case .pedra:     return Color(hex: "C5B78C")
        case .psiquico:  return Color(hex: "FA7179")
        case .terrestre: return Color(hex: "D97845")
        case .venenoso:  return Color(hex: "B567CE")
        case .voador:    return Color(hex: "89AAE3")
        }
    }
    
    var displayName: String {
        switch self {
        case .todos:     return "Todos"
        case .agua:      return "Água"
        case .dragao:    return "Dragão"
        case .eletrico:  return "Elétrico"
        case .fada:      return "Fada"
        case .fantasma:  return "Fantasma"
        case .fogo:      return "Fogo"
        case .gelo:      return "Gelo"
        case .grama:     return "Grama"
        case .inseto:    return "Inseto"
        case .lutador:   return "Lutador"
        case .normal:    return "Normal"
        case .noturno:   return "Noturno"
        case .metal:     return "Metal"
        case .pedra:     return "Pedra"
        case .psiquico:  return "Psíquico"
        case .terrestre: return "Terrestre"
        case .venenoso:  return "Venenoso"
        case .voador:    return "Voador"
        }
    }
    
    var iconName: String {
        "icon_\(self.rawValue)"
    }
}
