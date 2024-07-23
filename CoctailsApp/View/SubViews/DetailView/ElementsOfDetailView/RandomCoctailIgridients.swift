//
//  RandomCoctailIgridients.swift
//  CoctailsApp
//
//  Created by Roman on 21/07/2024.
//

import SwiftUI

struct RandomCoctailIgridients: View {
    @StateObject var controller = Controller()
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<controller.recipe.ingredients.count, id: \.self) { index in
                HStack(spacing: 0) {
                    
                    VStack {
                        Text(controller.recipe.ingredients[index])
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(width: UIScreen.main.bounds.width / 1.8)
                    .padding(.leading, 5)
                    .background(Color.white.opacity(0.8))
                    VStack {
                        Text(controller.recipe.proportions[index])
                    }
                    .frame(width: UIScreen.main.bounds.width / 3.2)
                    .background(.red.opacity(0.6))
                }
                .font(.headline)
            }
        }
    }
}
