//
//  CardListView.swift
//  PokemonCards
//
//  Created by Rafael Santos on 23/03/2025.
//
import SwiftUI

struct CardListView: View {
    @ObservedObject var viewModel: CardListViewModel

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView(StringConstants.loading)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: SizeConstants.padding) {
                            ForEach(viewModel.filteredCards) { card in
                                NavigationLink(destination: CardDetailView(basicCard: card)) {
                                    CardGridItemView(card: card)
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle(StringConstants.cardListTitle)
            .searchable(text: $viewModel.searchText, prompt: StringConstants.searchCard)
        }
    }
}
