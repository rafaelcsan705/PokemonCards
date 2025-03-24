//
//  CardListViewModel.swift
//  PokemonCards
//
//  Created by Rafael Santos on 23/03/2025.
//
import Foundation

@MainActor
final class CardListViewModel: ObservableObject {
    @Published var allCards: [PokemonCardListItem] = []
    @Published var isLoading = false
    @Published var searchText: String = ""

    private let service: CardServicing

    init(service: CardServicing = CardService()) {
        self.service = service
    }

    var filteredCards: [PokemonCardListItem] {
        guard !searchText.isEmpty else { return allCards }
        let query = searchText.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()

        return allCards.filter {
            $0.name.lowercased().contains(query)
        }
    }

    func loadAllCards() async {
        isLoading = true
        do {
            let cards = try await service.fetchAllCards()
            allCards = cards.filter { $0.image?.getLowQualityImage() != nil }
        } catch {
            print("\(StringConstants.errorLoadingCards): \(error)")
        }
        isLoading = false
    }
}
