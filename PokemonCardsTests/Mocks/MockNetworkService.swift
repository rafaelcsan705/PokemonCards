//
//  MockNetworkService.swift
//  PokemonCards
//
//  Created by Rafael Santos on 24/03/2025.
//
import XCTest
@testable import PokemonCards

final class MockNetworkService: NetworkServicing {
    var cardsToReturn: [PokemonCardListItem] = []
    var detailToReturn: PokemonCardDetail?
    var shouldFail: Bool = false

    func fetchCards() async throws -> [PokemonCardListItem] {
        if shouldFail {
            throw NetworkError.requestFailed
        }
        return cardsToReturn
    }

    func fetchCardDetail(id: String) async throws -> PokemonCardDetail {
        if shouldFail || detailToReturn == nil {
            throw NetworkError.requestFailed
        }
        return detailToReturn!
    }
}
