//
//  NetworkService.swift
//  PokemonCards
//
//  Created by Rafael Santos on 23/03/2025.
//
import Foundation

protocol NetworkServicing {
    func fetchCards() async throws -> [PokemonCardListItem]
    func fetchCardDetail(id: String) async throws -> PokemonCardDetail
}

final class NetworkService: NetworkServicing {
    func fetchCards() async throws -> [PokemonCardListItem] {
        guard let url = URL(string: APIConstants.baseURL + APIConstants.Paths.cards) else {
            throw NetworkError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkError.requestFailed
        }

        return try JSONDecoder().decode([PokemonCardListItem].self, from: data)
    }

    func fetchCardDetail(id: String) async throws -> PokemonCardDetail {
        guard let encodedID = id.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) else {
            throw NetworkError.invalidURL
        }

        let fullURLString = APIConstants.baseURL + APIConstants.Paths.detail(id: encodedID)

        guard let url = URL(string: fullURLString) else {
            throw NetworkError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkError.requestFailed
        }

        return try JSONDecoder().decode(PokemonCardDetail.self, from: data)
    }
}
