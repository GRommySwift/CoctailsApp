//
//  DetailView.swift
//  CocktailsApp
//
//  Created by Roman on 23/07/2024.
//

import SwiftUI

// Detail information about cocktail, used on all screens

struct DetailView: View {
    let widthOfImage: CGFloat
    let topPadding: CGFloat
    let buttonIsHidden: Bool
    let cocktail: Drink
    let isFavorite: @MainActor () -> Bool
    let addFavorite: @MainActor () -> Void
    let removeFavorite: @MainActor () -> Void
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            ScrollView(.vertical, showsIndicators: false) {
                CocktailAsyncImage(widthOfImage: widthOfImage, withText: true, cocktail: cocktail)
                DescriptionCocktail(cocktail: cocktail)
                Spacer()
                CocktailIngredients(recipe: cocktail.getRecipe())
            }
            .padding(.top, topPadding)
            .toolbar(.hidden, for: .navigationBar)
            .background(.linearGradient(Gradient(colors: [.mint.opacity(0.8), .indigo.opacity(0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing))
            HStack{
                if !buttonIsHidden {
                    BackButtonView()
                        .padding(.leading, 20)
                }
                Spacer()
                FavoriteButton(cocktail: cocktail, isFavorite: isFavorite() , addFavorite: addFavorite, removeFavorite: removeFavorite)
                    .padding(.trailing, 20)
                    .foregroundColor(.orange)
            }
            
        }
    }
}
