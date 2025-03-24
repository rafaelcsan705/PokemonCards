//
//  CardListViewModelTests.swift
//  PokemonCards
//
//  Created by Rafael Santos on 24/03/2025.
//

import XCTest
@testable import PokemonCards

@MainActor
final class CardListViewModelTests: XCTestCase {

    func testLoadAllCardsSuccess() async {
        let mock = MockNetworkService()
        mock.cardsToReturn = [.mockPikachu, .mockCharizard]
        let viewModel = CardListViewModel(service: CardService(network: mock))

        await viewModel.loadAllCards()

        XCTAssertFalse(viewModel.isLoading)
        XCTAssertEqual(viewModel.allCards.count, 2)
        XCTAssertEqual(viewModel.allCards.first?.name, "Pikachu")
    }

    func testLoadAllCardsFailure() async {
        let mock = MockNetworkService()
        mock.shouldFail = true
        let viewModel = CardListViewModel(service: CardService(network: mock))

        await viewModel.loadAllCards()

        XCTAssertFalse(viewModel.isLoading)
        XCTAssertTrue(viewModel.allCards.isEmpty)
    }

    func testSearchTextFiltersCorrectly() {
        let mock = MockNetworkService()
        let viewModel = CardListViewModel(service: CardService(network: mock))
        viewModel.allCards = [.mockPikachu, .mockCharizard]

        viewModel.searchText = "pika"
        XCTAssertEqual(viewModel.filteredCards.count, 1)
        XCTAssertEqual(viewModel.filteredCards.first?.name, "Pikachu")

        viewModel.searchText = "char"
        XCTAssertEqual(viewModel.filteredCards.count, 1)
        XCTAssertEqual(viewModel.filteredCards.first?.name, "Charizard")

        viewModel.searchText = "xyz"
        XCTAssertEqual(viewModel.filteredCards.count, 0)
    }
}
