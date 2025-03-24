//
//  CardImageView.swift
//  PokemonCards
//
//  Created by Rafael Santos on 24/03/2025.
//
import SwiftUI

struct CardImageView: View {
    let url: URL?

    var body: some View {
        AsyncImage(url: url) { phase in
            image(for: phase)
        }
        .frame(height: SizeConstants.smallCardHeight)
        .clipped()
    }

    @ViewBuilder
    private func image(for phase: AsyncImagePhase) -> some View {
        switch phase {
        case .empty, .failure:
            placeholderImage
        case .success(let image):
            image
                .resizable()
                .scaledToFill()
        @unknown default:
            placeholderImage
        }
    }
}

extension CardImageView {
    private var placeholderImage: some View {
        Image("pokemon_card")
            .resizable()
            .scaledToFill()
    }
}
