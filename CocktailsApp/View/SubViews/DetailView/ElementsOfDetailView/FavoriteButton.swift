//
//  FavoriteButton.swift
//  CocktailsApp
//
//  Created by Roman on 27/07/2024.
//

import SwiftUI

struct FavoriteButton: View {
    let cocktail: Drink
    let isFavorite: Bool
    let addFavorite: @MainActor () -> Void
    let removeFavorite: @MainActor () -> Void
    
    var body: some View {
        Button {
            if isFavorite {
                removeFavorite()
                print("deleted")
            } else {
                addFavorite()
                print("added")
            }
        } label: {
            ZStack {
                Circle()
                    .frame(width: 34)
                    .foregroundColor(.black)
                    .opacity(0.3)
                Image(isFavorite ? "star.fill" : "star")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(isFavorite ? .orange : .gray)
                    .opacity(0.8)
            }
        }
    }
}

