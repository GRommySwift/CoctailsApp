//
//  DescriptionCocktail.swift
//  CocktailsApp
//
//  Created by Roman on 23/07/2024.
//

import SwiftUI


struct DescriptionCocktail: View {
    let cocktail: Drink
    var body: some View {
        VStack(spacing: 5) {
            Text("Category - \(cocktail.strCategory)" + " " + "(\(cocktail.strAlcoholic))")
                
                .foregroundColor(Color.black).opacity(0.8)
                .padding(.horizontal, 20)
            Text("Instruction:")
                .foregroundColor(Color.black).opacity(0.8)
            Text(cocktail.strInstructions)
                .foregroundColor(Color.black).opacity(0.7)
                .padding(.horizontal, 20)
                
            Text("Ingridients")
                
        }
        .font(.body)
    }
}

