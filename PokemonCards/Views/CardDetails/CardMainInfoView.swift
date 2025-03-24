//
//  CardMainInfoView.swift
//  PokemonCards
//
//  Created by Rafael Santos on 24/03/2025.
//
import SwiftUI

struct CardMainInfoView: View {
    let card: PokemonCardDetail

    var body: some View {
        VStack(alignment: .center, spacing: SizeConstants.padding) {
            if let types = card.types, let stage = card.stage  {
                HStack {
                    Spacer()
                    Text(card.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                }
                
                HPBarView(currentHP: card.hp ?? 0, type: card.types?.first ?? "")
                    .frame(height: SizeConstants.size_16)

                Text("\(StringConstants.cardDetailType) \(types.joined(separator: ", ")) | \(StringConstants.cardDetailStage) \(stage)")
                    .font(.subheadline)
            }
        }
        .padding(.horizontal)
    }
}
