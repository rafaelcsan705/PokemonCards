//
//  NetworkError.swift
//  PokemonCards
//
//  Created by Rafael Santos on 23/03/2025.
//
import Foundation

enum NetworkError: Error {
    case invalidURL
    case requestFailed
    case decodingFailed
}
