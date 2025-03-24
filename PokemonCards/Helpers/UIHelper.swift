//
//  UIHelper.swift
//  PokemonCards
//
//  Created by Rafael Santos on 24/03/2025.
//

import SwiftUI

// MARK: - Gradients

func gradientBackground(for type: String, horizontal: Bool = false) -> LinearGradient {
    let start: UnitPoint = horizontal ? .leading : .top
    let end: UnitPoint = horizontal ? .trailing : .bottom

    switch type.lowercased() {
    case "fire": return LinearGradient(colors: [.orange, .red], startPoint: start, endPoint: end)
    case "grass": return LinearGradient(colors: [.green, .mint], startPoint: start, endPoint: end)
    case "water": return LinearGradient(colors: [.blue, .cyan], startPoint: start, endPoint: end)
    case "psychic": return LinearGradient(colors: [.purple, .indigo], startPoint: start, endPoint: end)
    case "fighting": return LinearGradient(colors: [.brown, .orange], startPoint: start, endPoint: end)
    case "lightning": return LinearGradient(colors: [.yellow, .orange], startPoint: start, endPoint: end)
    case "metal": return LinearGradient(colors: [.gray, .black.opacity(0.7)], startPoint: start, endPoint: end)
    case "darkness": return LinearGradient(colors: [.black, .gray], startPoint: start, endPoint: end)
    case "fairy": return LinearGradient(colors: [.pink, .purple], startPoint: start, endPoint: end)
    default: return LinearGradient(colors: [.gray, .white], startPoint: start, endPoint: end)
    }
}

// MARK: - Emojis

func emojiForEnergy(_ type: String) -> String {
    switch type.lowercased() {
    case "grass": return "🌿"
    case "fire": return "🔥"
    case "water": return "💧"
    case "psychic": return "🌀"
    case "colorless": return "⚪️"
    case "fighting": return "🥊"
    case "lightning": return "⚡️"
    case "darkness": return "🌑"
    case "metal": return "🔩"
    case "dragon": return "🐉"
    case "fairy": return "✨"
    default: return type
    }
}

// MARK: - Badges

func variantBadge(_ title: String) -> some View {
    Text(title)
        .font(.caption)
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(AppColors.detailDescriptionBackground)
        .cornerRadius(8)
}
