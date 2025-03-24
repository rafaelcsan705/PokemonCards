//
//  PokemonCardDetail.swift
//  PokemonCards
//
//  Created by Rafael Santos on 23/03/2025.
//
import Foundation

struct PokemonCardDetail: Decodable {
    let id: String
    let name: String
    let category: String
    let image: String
    let illustrator: String
    let rarity: String?
    let localId: String
    let hp: Int?
    let types: [String]?
    let stage: String?
    let suffix: String?
    let dexId: [Int]?
    let retreat: Int?
    let updated: String?

    let attacks: [Attack]?
    let weaknesses: [Weakness]?
    let variants: Variants?
    let set: CardSet?
    let legal: Legal?

    struct Attack: Decodable {
        let cost: [String]
        let name: String
        let effect: String?
        let damage: String?

        enum CodingKeys: String, CodingKey {
            case cost, name, effect, damage
        }
        
        init(cost: [String], name: String, effect: String?, damage: String?) {
            self.cost = cost
            self.name = name
            self.effect = effect
            self.damage = damage
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)

            cost = try container.decode([String].self, forKey: .cost)
            name = try container.decode(String.self, forKey: .name)
            effect = try container.decodeIfPresent(String.self, forKey: .effect)

            if let damageString = try? container.decode(String.self, forKey: .damage) {
                damage = damageString
            } else if let damageInt = try? container.decode(Int.self, forKey: .damage) {
                damage = String(damageInt)
            } else {
                damage = nil
            }
        }
    }

    struct Weakness: Decodable {
        let type: String?
        let value: String?
    }

    struct Variants: Decodable {
        let firstEdition: Bool
        let holo: Bool
        let normal: Bool
        let reverse: Bool
        let wPromo: Bool
    }

    struct CardSet: Decodable {
        let id: String
        let name: String
        let logo: String?
        let symbol: String?
        let cardCount: CardCount
    }

    struct CardCount: Decodable {
        let official: Int
        let total: Int
    }

    struct Legal: Decodable {
        let standard: Bool
        let expanded: Bool
    }
}

extension PokemonCardDetail.CardSet {
    var logoURL: URL? {
        guard let logo else { return nil }
        return URL(string: "\(logo).png")
    }

    var symbolURL: URL? {
        guard let symbol else { return nil }
        return URL(string: "\(symbol).png")
    }
}
