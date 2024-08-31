//
//  RandomCocktailIgredients .swift
//  CocktailsApp
//
//  Created by Roman on 21/07/2024.
//

import SwiftUI
// comment

struct CocktailIngredients: View {
    let recipe: RecipeModel
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<recipe.proportions.count, id: \.self) { index in
                HStack(spacing: 0) {
                    VStack {
                        Text(recipe.ingredients[index])
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundStyle(.black).opacity(0.8)
                    }
                    .frame(width: UIScreen.main.bounds.width / 1.8)
                    .padding(.leading, 5)
                    .background(Color.white.opacity(0.8))
                    VStack {
                        Text(recipe.proportions[index])
                            .foregroundStyle(.black).opacity(0.8)
                    }
                    .frame(width: UIScreen.main.bounds.width / 3.2)
                    .background(.foregroundColor)
                }
                .font(.body)
            }
        }
    }
}
