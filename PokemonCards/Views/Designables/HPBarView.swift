//
//  HPBarView.swift
//  PokemonCards
//
//  Created by Rafael Santos on 24/03/2025.
//
import SwiftUI

struct HPBarView: View {
    let currentHP: Int
    let type: String

    var body: some View {
        HStack {
            Spacer()
            
            VStack(spacing: SizeConstants.size_04) {
                GeometryReader { geometry in
                    let totalWidth = geometry.size.width
                    let fillWidth = totalWidth * CGFloat(currentHP) / SizeConstants.maxHp

                    ZStack(alignment: .leading) {
                        Capsule()
                            .fill(AppColors.detailDescriptionBackground)
                            .frame(height: SizeConstants.size_16)
                        Capsule()
                            .fill(gradientBackground(for: type))
                            .frame(width: fillWidth, height: SizeConstants.size_16)
                    }
                }
                .frame(height: SizeConstants.size_16)

                Text("\(StringConstants.cardDetailHp) \(currentHP)")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            .frame(maxWidth: UIScreen.main.bounds.width * 0.5)
            
            Spacer()
        }
    }
}
