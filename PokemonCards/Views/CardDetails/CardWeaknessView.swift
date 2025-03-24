//
//  CardWeaknessView.swift
//  PokemonCards
//
//  Created by Rafael Santos on 24/03/2025.
//
import SwiftUI

struct CardWeaknessView: View {
    let weaknesses: [PokemonCardDetail.Weakness]

    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: SizeConstants.cornerRadius_08) {
                if !weaknesses.isEmpty {
                    Text(StringConstants.cardDetailWeakness)
                        .font(.headline)

                    ForEach(weaknesses, id: \.type) { weakness in
                        if let type = weakness.type, let value = weakness.value {
                            HStack {
                                Text(type)
                                Spacer()
                                Text(emojiForWeakness(type: type, value: value))
                            }
                        }
                    }
                }
            }
            .padding()
            .background(AppColors.detailDescriptionBackground)
            .cornerRadius(SizeConstants.cornerRadius_08)
        }
        .padding(.horizontal)
    }
    
    func emojiForWeakness(type: String, value: String) -> String {
        let emoji = emojiForEnergy(type)
        let multiplier = Int(value.filter("123456789".contains)) ?? 1
        return String(repeating: emoji, count: multiplier)
    }
}
