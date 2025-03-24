//
//  CardAttackListView.swift
//  PokemonCards
//
//  Created by Rafael Santos on 24/03/2025.
//
import SwiftUI

struct CardAttackListView: View {
    let attacks: [PokemonCardDetail.Attack]

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: SizeConstants.size_12) {
                Text("\(StringConstants.cardDetailAttacks):")
                    .font(.headline)

                ForEach(attacks.indices, id: \.self) { index in
                    let atk = attacks[index]
                    VStack(alignment: .leading, spacing: SizeConstants.size_04) {
                        HStack {
                            Text(atk.name).fontWeight(.semibold)
                            Spacer()
                            Text(atk.damage ?? "")
                        }

                        if let effect = atk.effect {
                            Text(effect)
                                .font(.caption)
                        }

                        HStack(spacing: SizeConstants.size_04) {
                            ForEach(atk.cost, id: \.self) { cost in
                                Text(emojiForEnergy(cost))
                            }
                        }
                    }
                    .padding()
                    .background(AppColors.detailStrongDescriptionBackground)
                    .cornerRadius(SizeConstants.cornerRadius_08)
                }
            }
            .padding()
            .background(AppColors.detailDescriptionBackground)
            .cornerRadius(SizeConstants.cornerRadius_08)
        }
        .padding(.horizontal)
    }
}
