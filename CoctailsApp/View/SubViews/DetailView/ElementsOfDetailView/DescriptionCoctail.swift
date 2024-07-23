//
//  DescriptionCoctail.swift
//  CoctailsApp
//
//  Created by Roman on 23/07/2024.
//

import SwiftUI


struct DescriptionCoctail: View {
    let coctail: Drink
    var body: some View {
        VStack(spacing: 5) {
            Text("Category - \(coctail.strCategory)" + " " + "(\(coctail.strAlcoholic))")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(Color.orange.opacity(0.8))
            
            Text("Instruction:")
                .foregroundColor(Color.cyan)
            Text(coctail.strInstructions)
                .foregroundColor(Color.cyan)
                .padding(.leading, 20)
                .padding(.trailing, 20)
            
            Text("Ingridients")
                .font(.headline)
                .fontWeight(.bold)
            
            
        }
    }
}

