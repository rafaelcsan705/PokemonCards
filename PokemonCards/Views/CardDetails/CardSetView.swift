//
//  CardSetView.swift
//  PokemonCards
//
//  Created by Rafael Santos on 24/03/2025.
//
import SwiftUI

struct CardSetView: View {
    let card: PokemonCardDetail

    var body: some View {
        VStack(alignment: .leading) {
            if let set = card.set {
                HStack() {
                    if let logoURL = set.logoURL {
                        AsyncImage(url: logoURL) { image in
                            image.resizable().scaledToFit()
                        } placeholder: { AppColors.detailDescriptionBackground }
                        .frame(height: SizeConstants.symbolImageHeight)
                    }
                    
                    Spacer()

                    VStack(alignment: .center) {
                        if let symbolURL = set.symbolURL {
                            AsyncImage(url: symbolURL) { image in
                                image.resizable().scaledToFit()
                            } placeholder: { AppColors.detailDescriptionBackground }
                            .frame(height: SizeConstants.symbolImageHeight)
                        }
                        Text("\(StringConstants.cardDetailCard) \(card.localId) \(StringConstants.cardDetailOf) \(set.cardCount.official)")
                            .font(.caption)
                    }
                }
                .padding()
                .background(AppColors.detailDescriptionBackground)
                .cornerRadius(SizeConstants.cornerRadius_08)
            }
        }
        .padding(.horizontal)
    }
}
