//
//  PokemonCardListItem.swift
//  PokemonCardListItem
//
//  Created by Rafael Santos on 23/03/2025.
//
import Foundation

struct PokemonCardListItem: Decodable, Identifiable {
    let id: String
    let localId: String
    let name: String
    let image: String?
}

extension PokemonCardListItem {
    var hasValidImage: Bool {
        image?.getLowQualityImage() != nil
    }

    var lowQualityImageURL: URL? {
        image?.getLowQualityImage()
    }
}

