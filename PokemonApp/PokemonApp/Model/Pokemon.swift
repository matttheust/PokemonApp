//
//  Pokemon.swift
//  PokemonApp
//
//  Created by Matheus  Torres on 12/04/25.
//

import Foundation

struct Pokemon: Codable, Identifiable {
    let name: String
    let url: String
    var id: String { name } // Usamos o nome como ID
}

struct PokemonListResponse: Codable {
    let results: [Pokemon]
}

struct PokemonDetails: Codable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let base_experience: Int
    let abilities: [Ability]
    let types: [PokemonTipo]
    let sprites: Sprites
    let moves: [Move]
    let held_items: [HeldItem]

    struct Ability: Codable {
        let ability: AbilityDetail
        let is_hidden: Bool
        let slot: Int
    }

    struct AbilityDetail: Codable {
        let name: String
        let url: String
    }

    struct PokemonTipo: Codable {
        let type: TipoDetalhe

        struct TipoDetalhe: Codable {
            let name: String
        }
    }

    struct Sprites: Codable {
        let front_default: String?
        let back_default: String?
        let front_shiny: String?
        let back_shiny: String?
    }
    
    struct Move: Codable {
        let move: MoveDetail
        let version_group_details: [VersionGroupDetail]
    }

    struct MoveDetail: Codable {
        let name: String
        let url: String
    }
    
    struct VersionGroupDetail: Codable {
        let level_learned_at: Int
        let move_learn_method: MoveLearnMethod
        let version_group: VersionGroup
    }

    struct MoveLearnMethod: Codable {
        let name: String
        let url: String
    }

    struct VersionGroup: Codable {
        let name: String
        let url: String
    }
    
    struct HeldItem: Codable {
        let item: ItemDetail
        let version_details: [VersionDetail]
    }

    struct ItemDetail: Codable {
        let name: String
        let url: String
    }

    struct VersionDetail: Codable {
        let rarity: Int
        let version: Version
    }

    struct Version: Codable {
        let name: String
        let url: String
    }
}
