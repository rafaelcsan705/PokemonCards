//
//  CardDetailViewModel.swift
//  PokemonCards
//
//  Created by Rafael Santos on 23/03/2025.
//
import Foundation

@MainActor
final class CardDetailViewModel: ObservableObject {
    @Published var cardDetail: PokemonCardDetail?
    @Published var isLoading = false
    @Published var error: String?
    
    private let service = CardService()
    
    func loadCardDetail(for id: String) async {
        isLoading = true
        error = nil
        
        do {
            cardDetail = try await service.fetchCardDetail(id: id)
        } catch {
            self.error = StringConstants.errorLoadingCardDetail
        }
        isLoading = false
    }
}
