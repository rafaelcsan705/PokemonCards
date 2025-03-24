//
//  SplashView.swift
//  PokemonCards
//
//  Created by Rafael Santos on 23/03/2025.
//

import SwiftUI

struct SplashView: View {
    @StateObject private var viewModel = CardListViewModel()
    
    @State private var animate = false
    @State private var isActive = false

    var body: some View {
        if isActive {
            CardListView(viewModel: viewModel)
        } else {
            ZStack {
                Image("splash_background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack(spacing: 16) {
                    Image("pokemon_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: SizeConstants.logoSize)
                        .opacity(animate ? 1 : 0)
                        .animation(.easeIn(duration: 1.2), value: animate)
                    Spacer()
                    
                    Text("by: Rafael Santos")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .opacity(animate ? 1 : 0)
                        .animation(.easeIn(duration: 1.5), value: animate)
                }
            }
            .onAppear {
                animate = true
                Task {
                    await viewModel.loadAllCards()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        isActive = true
                    }
                }
            }
        }
    }
}
