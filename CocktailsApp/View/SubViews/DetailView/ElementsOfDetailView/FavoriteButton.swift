//
//  FavoriteButton.swift
//  CocktailsApp
//
//  Created by Roman on 27/07/2024.
//

import SwiftUI

struct FavoriteButton: View {
   // @State private var localChangesOfIsFavorite: Bool
    let cocktail: Drink
    let isFavorite: Bool
    let addFavorite: () -> Void
    let removeFavorite: () -> Void
    
    
    var body: some View {
        
        Button {
            if isFavorite {
                removeFavorite()
            } else {
                addFavorite()
            }
        } label: {
            ZStack {
                Circle()
                    .frame(width: 34)
                    .foregroundColor(.black)
                    .opacity(0.3)
                Image(isFavorite ? "star.fill" : "star")
                    .renderingMode(.template)
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(isFavorite ? .yellow : .white)
                    .opacity(0.8)
            }
        }
    }
}

