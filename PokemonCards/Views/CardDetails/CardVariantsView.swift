//
//  CardVariantsView.swift
//  PokemonCards
//
//  Created by Rafael Santos on 24/03/2025.
//
import SwiftUI

struct CardVariantsView: View {
    let variants: PokemonCardDetail.Variants?

    var body: some View {
        if let variants = variants {
            HStack {
                if variants.holo { variantBadge(StringConstants.cardDetailVariantHolo) }
                if variants.reverse { variantBadge(StringConstants.cardDetailVariandReverse) }
                if variants.normal { variantBadge(StringConstants.cardDetailVariandNormal) }
                if variants.firstEdition { variantBadge(StringConstants.cardDetailVariandFirstEdition) }
                if variants.wPromo { variantBadge(StringConstants.cardDetailVariandPromo) }
            }
            .padding(.horizontal)
        }
    }
}
