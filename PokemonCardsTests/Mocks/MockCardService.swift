//
//  CardServiceTests.swift
//  PokemonCards
//
//  Created by Rafael Santos on 24/03/2025.
//

import XCTest
@testable import PokemonCards

final class CardServiceTests: XCTestCase {

    func testFetchAllCardsReturnsExpectedCards() async throws {
        let mockService = MockNetworkService()
        mockService.cardsToReturn = [.mockPikachu, .mockCharizard]

        let service = CardService(network: mockService)
        let cards = try await service.fetchAllCards()

        XCTAssertEqual(cards.count, 2)
        XCTAssertEqual(cards.first?.name, "Pikachu")
    }

    func testFetchAllCardsReturnsEmptyArray() async throws {
        let mockService = MockNetworkService()
        mockService.cardsToReturn = []

        let service = CardService(network: mockService)
        let cards = try await service.fetchAllCards()

        XCTAssertEqual(cards.count, 0)
    }

    func testFetchAllCardsThrowsError() async {
        let mockService = MockNetworkService()
        mockService.shouldFail = true

        let service = CardService(network: mockService)

        do {
            _ = try await service.fetchAllCards()
            XCTFail("Expected error to be thrown")
        } catch let error as NetworkError {
            XCTAssertEqual(error, .requestFailed)
        } catch {
            XCTFail("Unexpected error type")
        }
    }

    func testFetchCardDetailReturnsExpectedDetail() async throws {
        let mockService = MockNetworkService()
        mockService.detailToReturn = PokemonCardListItem.mockDetail

        let service = CardService(network: mockService)
        let detail = try await service.fetchCardDetail(id: "xy11-1")

        XCTAssertEqual(detail.name, "Tangela")
        XCTAssertEqual(detail.hp, 80)
    }

    func testFetchCardDetailThrowsErrorWhenMissingDetail() async {
        let mockService = MockNetworkService()
        mockService.detailToReturn = nil

        let service = CardService(network: mockService)

        do {
            _ = try await service.fetchCardDetail(id: "invalid")
            XCTFail("Expected error to be thrown")
        } catch let error as NetworkError {
            XCTAssertEqual(error, .requestFailed)
        } catch {
            XCTFail("Unexpected error type")
        }
    }

    func testFetchCardDetailThrowsErrorWhenShouldFail() async {
        let mockService = MockNetworkService()
        mockService.shouldFail = true

        let service = CardService(network: mockService)

        do {
            _ = try await service.fetchCardDetail(id: "any")
            XCTFail("Expected error to be thrown")
        } catch let error as NetworkError {
            XCTAssertEqual(error, .requestFailed)
        } catch {
            XCTFail("Unexpected error type")
        }
    }
}
