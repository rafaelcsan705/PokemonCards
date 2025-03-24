//
//  CardIllustrator.swift
//  PokemonCards
//
//  Created by Rafael Santos on 24/03/2025.
//
import SwiftUI

struct CardIllustrator: View {
    let card: PokemonCardDetail

    var body: some View {
        HStack() {
            Spacer()
            Text("\(StringConstants.cardDetailIllustrator) \(card.illustrator)")
                .font(.caption)
            Spacer()
        }
    }
}
