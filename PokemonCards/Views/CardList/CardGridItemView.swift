//
//  Untitled.swift
//  PokemonCards
//
//  Created by Rafael Santos on 23/03/2025.
//
import SwiftUI

struct CardGridItemView: View {
    @Environment(\.colorScheme) var colorScheme
    let card: PokemonCardListItem

    var body: some View {
        VStack {
            if let url = card.image?.getLowQualityImage() {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        Image("pokemon_card")
                            .resizable()
                            .scaledToFill()
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                    case .failure(let error):
                        Image("pokemon_card")
                            .resizable()
                            .scaledToFill()
                    }
                }
                .frame(height: SizeConstants.smallCardHeight)
                .clipped()
            }

            Text(card.name)
                .font(.footnote)
                .fontWeight(.bold)
                .lineLimit(1)
                .foregroundColor(.primary)
        }
        .padding(SizeConstants.size_08)
        .background(Color(uiColor: .systemBackground))
        .cornerRadius(SizeConstants.cornerRadius_08)
        .shadow(
            color: colorScheme == .dark ? .white.opacity(0.8) : .black.opacity(0.3),
            radius: SizeConstants.cornerRadius_04,
            y: 2
        )
    }
}
