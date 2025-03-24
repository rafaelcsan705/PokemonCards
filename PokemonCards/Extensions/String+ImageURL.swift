//
//  String+ImageURL.swift
//  PokemonCards
//
//  Created by Rafael Santos on 23/03/2025.
//
import Foundation

enum ImageQuality: String {
    case low, high
}

enum ImageFormat: String {
    case webp, png, jpg
}

extension String {
    private func getImageURL(quality: ImageQuality = .high, format: ImageFormat = .webp) -> URL? {
        return URL(string: "\(self)/\(quality.rawValue).\(format.rawValue)")
    }

    func getHighQualityImage(format: ImageFormat = .webp) -> URL? {
        return getImageURL(quality: .high, format: format)
    }

    func getLowQualityImage(format: ImageFormat = .webp) -> URL? {
        return getImageURL(quality: .low, format: format)
    }
}
