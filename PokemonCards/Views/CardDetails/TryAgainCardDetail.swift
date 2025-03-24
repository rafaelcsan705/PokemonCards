//
//  TryAgainCardDetail.swift
//  PokemonCards
//
//  Created by Rafael Santos on 24/03/2025.
//
import SwiftUI

struct TryAgainCardDetail: View {
    @ObservedObject var viewModel: CardDetailViewModel
    let errorMessage: String
    let basicCard: PokemonCardListItem
    
    var body: some View {
        VStack(spacing: SizeConstants.padding) {
            if let url = basicCard.image?.getHighQualityImage() {
                AsyncImage(url: url) { image in
                    image.resizable().scaledToFit()
                        .shadow(color: Color.black.opacity(0.8),
                                radius: SizeConstants.cornerRadius_08, x: 0, y: SizeConstants.cornerRadius_04)
                } placeholder: {
                    Image("pokemon_card")
                        .resizable()
                        .scaledToFit()
                        .shadow(color: Color.black.opacity(0.4),
                                radius: SizeConstants.cornerRadius_08, x: 0, y: SizeConstants.cornerRadius_04)
                }
                .frame(height: SizeConstants.largeCardHeight)
                .padding(.horizontal)
            }
            
            Text(StringConstants.errorLoadingCardDetail)
                .foregroundColor(.red)
                .multilineTextAlignment(.center)
            Text(errorMessage)
                .foregroundColor(.red)
                .multilineTextAlignment(.center)
            
            Button(StringConstants.tryAgain) {
                Task {
                    await viewModel.loadCardDetail(for: basicCard.id)
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
