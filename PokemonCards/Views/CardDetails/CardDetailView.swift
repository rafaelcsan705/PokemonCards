//
//  CardDetailView.swift
//  PokemonCards
//
//  Created by Rafael Santos on 23/03/2025.
//
import SwiftUI

struct CardDetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = CardDetailViewModel()
    
    let basicCard: PokemonCardListItem

    var body: some View {
        ScrollView {
            if let types = viewModel.cardDetail?.types, let mainType = types.first {
                ZStack(alignment: .top) {
                
                    RoundedRectangle(cornerRadius: SizeConstants.size_08, style: .circular)
                        .fill(gradientBackground(for: mainType))
                        .frame(height: SizeConstants.largeCardHeight)
                        .ignoresSafeArea(edges: .top)
                        .offset(y: -SizeConstants.size_08)
                        .shadow(color: Color.black.opacity(0.8),
                                radius: SizeConstants.cornerRadius_08, x: 0, y: SizeConstants.cornerRadius_04)

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
                        
                        if viewModel.isLoading {
                            ProgressView(StringConstants.loading)
                                .padding()
                        } else if let error = viewModel.error {
                            TryAgainCardDetail(viewModel: viewModel, errorMessage: error, basicCard: basicCard)
                        } else if let card = viewModel.cardDetail {
                            CardMainInfoView(card: card)
                            CardVariantsView(variants: card.variants)
                            CardAttackListView(attacks: card.attacks ?? [])
                            CardWeaknessView(weaknesses: card.weaknesses ?? [])
                            CardSetView(card: card)
                            CardIllustrator(card: card)
                        }
                    }
                    .padding(.top, SizeConstants.largePadding)
                }
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: { dismiss() }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: SizeConstants.size_18, weight: .medium))
                        .foregroundColor(.primary)
                }
            }
            ToolbarItem(placement: .principal) {
                EmptyView()
            }
        }
        .toolbarBackground(.visible, for: .automatic)
        .toolbarBackground(gradientBackground(for: viewModel.cardDetail?.types?.first ?? ""), for: .navigationBar)
        .task {
            await viewModel.loadCardDetail(for: basicCard.id)
        }
    }
}
