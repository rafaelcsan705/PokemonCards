//
//  MockCardListItem.swift
//  PokemonCards
//
//  Created by Rafael Santos on 24/03/2025.
//

@testable import PokemonCards

extension PokemonCardListItem {
    static let mockPikachu = PokemonCardListItem(
        id: "base1-58",
        localId: "58",
        name: "Pikachu",
        image: "https://assets.tcgdex.net/en/base/base1/58"
    )

    static let mockCharizard = PokemonCardListItem(
        id: "base1-4",
        localId: "4",
        name: "Charizard",
        image: "https://assets.tcgdex.net/en/base/base1/4"
    )
    
    static let mockDetail = PokemonCardDetail(
        id: "xy11-1",
        name: "Tangela",
        category: "Pokemon",
        image: "https://assets.tcgdex.net/en/xy/xy11/1",
        illustrator: "OOYAMA",
        rarity: "Common",
        localId: "1",
        hp: 80,
        types: ["Grass"],
        stage: "Basic",
        suffix: nil,
        dexId: [114],
        retreat: 3,
        updated: "2022-03-31T11:01:32+02:00",
        attacks: [
            PokemonCardDetail.Attack(cost: ["Grass", "Colorless"], name: "Slam", effect: "Flip 2 coins. This attack does 30 damage times the number of heads.", damage: "30×"),
            PokemonCardDetail.Attack(cost: ["Grass", "Grass", "Colorless"], name: "Mega Drain", effect: "Heal 20 damage from this Pokémon.", damage: "40")

        ],
        weaknesses: [PokemonCardDetail.Weakness(type: "Fire", value: "×2")],
        variants: PokemonCardDetail.Variants(
            firstEdition: false,
            holo: true,
            normal: true,
            reverse: true,
            wPromo: false
        ),
        set: PokemonCardDetail.CardSet(
            id: "xy11",
            name: "Steam Siege",
            logo: "https://assets.tcgdex.net/en/xy/xy11/logo",
            symbol: "https://assets.tcgdex.net/univ/xy/xy11/symbol",
            cardCount: PokemonCardDetail.CardCount(official: 114, total: 116)
        ),
        legal: PokemonCardDetail.Legal(
            standard: false,
            expanded: true
        )
    )
    
}
