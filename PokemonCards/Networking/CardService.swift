//
//  CardService.swift
//  PokemonCards
//
//  Created by Rafael Santos on 23/03/2025.
//

protocol CardServicing {
    func fetchAllCards() async throws -> [PokemonCardListItem]
    func fetchCardDetail(id: String) async throws -> PokemonCardDetail
}

final class CardService: CardServicing {
    private let network: NetworkServicing

    init(network: NetworkServicing = NetworkService()) {
        self.network = network
    }

    func fetchAllCards() async throws -> [PokemonCardListItem] {
        try await network.fetchCards()
    }

    func fetchCardDetail(id: String) async throws -> PokemonCardDetail {
        try await network.fetchCardDetail(id: id)
    }
}
