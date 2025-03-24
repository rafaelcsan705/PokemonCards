//
//  APIConstants.swift
//  PokemonCards
//
//  Created by Rafael Santos on 23/03/2025.
//

enum APIConstants {
    static let baseURL = "https://api.tcgdex.net/v2"

    enum Paths {
        static let cards = "/en/cards/"
        static func detail(id: String) -> String {
            "/en/cards/\(id)"
        }
    }
}
