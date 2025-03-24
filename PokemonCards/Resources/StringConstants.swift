//
//  StringConstants.swift
//  PokemonCards
//
//  Created by Rafael Santos on 23/03/2025.
//
import Foundation

enum StringConstants {
    static var loading: String { NSLocalizedString("loading", comment: "") }
    static var tryAgain: String { NSLocalizedString("try_again", comment: "") }
    static var searchCard: String { NSLocalizedString("search_card", comment: "") }
    static var errorLoadingCards: String { NSLocalizedString("error_loading_cards", comment: "") }
    static var errorLoadingCardDetail: String { NSLocalizedString("error_loading_card_detail", comment: "") }
    static var cardListTitle: String { NSLocalizedString("card_list_title", comment: "") }
    
    // Card Detail
    static var cardDetailAttacks: String { NSLocalizedString("detail_card_attacks", comment: "") }
    static var cardDetailIllustrator: String { NSLocalizedString("detail_card_illustrator", comment: "") }
    static var cardDetailType: String { NSLocalizedString("detail_card_type", comment: "") }
    static var cardDetailStage: String { NSLocalizedString("detail_card_stage", comment: "") }
    
    static var cardDetailCard: String { NSLocalizedString("detail_card_card", comment: "") }
    static var cardDetailOf: String { NSLocalizedString("detail_card_of", comment: "") }
    
    static var cardDetailHp: String { NSLocalizedString("detail_card_hp", comment: "") }
    
    static var cardDetailWeakness: String { NSLocalizedString("detail_card_weakness", comment: "") }
    
    static var cardDetailVariantHolo: String { NSLocalizedString("detail_card_variand_holo", comment: "") }
    static var cardDetailVariandReverse: String { NSLocalizedString("detail_card_variand_reverse", comment: "") }
    static var cardDetailVariandNormal: String { NSLocalizedString("detail_card_variand_normal", comment: "") }
    static var cardDetailVariandFirstEdition: String { NSLocalizedString("detail_card_variand_first_edition", comment: "") }
    static var cardDetailVariandPromo: String { NSLocalizedString("detail_card_variand_promo", comment: "") }
}
