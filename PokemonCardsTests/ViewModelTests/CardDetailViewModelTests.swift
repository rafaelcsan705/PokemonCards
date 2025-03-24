//
//  CardDetailViewModelTests.swift
//  PokemonCards
//
//  Created by Rafael Santos on 24/03/2025.
//
import XCTest
@testable import PokemonCards

@MainActor
final class CardDetailViewModelTests: XCTestCase {

    func testLoadCardDetailSuccess() async {
        let mock = MockNetworkService()
        mock.detailToReturn = PokemonCardListItem.mockDetail
        let service = CardService(network: mock)
        let viewModel = CardDetailViewModel()

        await viewModel.loadCardDetail(for: "xy1-42")

        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNotNil(viewModel.cardDetail)
        XCTAssertEqual(viewModel.cardDetail?.name, "Pikachu")
        XCTAssertNil(viewModel.error)
    }

    func testLoadCardDetailFailure() async {
        let mock = MockNetworkService()
        mock.detailToReturn = nil
        let service = CardService(network: mock)
        let viewModel = CardDetailViewModel()

        await viewModel.loadCardDetail(for: "invalid")

        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNil(viewModel.cardDetail)
        XCTAssertEqual(viewModel.error, StringConstants.errorLoadingCardDetail)
    }
}
