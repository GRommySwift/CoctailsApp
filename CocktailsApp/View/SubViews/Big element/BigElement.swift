//
//  BigElement.swift
//  CocktailsApp
//
//  Created by Roman on 24/07/2024.
//

import SwiftUI

// Large tile with image, name of cocktail and category of cocktail.
// This is the element of UI which used on main screen and search screen's

struct BigElementDrink: View {
    let cocktail: Drink
    var body: some View {
        HStack {
            VStack {
                CocktailAsyncImage(widthOfImage: UIScreen.main.bounds.width / 2.5, withText: false, cocktail: cocktail)
            }
            VStack {
                Text(cocktail.strDrink)
                    .font(.body)
                    .foregroundColor(.white)
                Text("Category - \(cocktail.strCategory)" + " " + "(\(cocktail.strAlcoholic))")
                    .font(.caption)
                    .foregroundColor(Color.red.opacity(0.8))
            }
            .frame(width: UIScreen.main.bounds.width / 2)
            
        }
        .background(.green.opacity(0.3)).cornerRadius(40)
        .shadow(radius: 6)
        .padding(.horizontal, 20)
    }
}
