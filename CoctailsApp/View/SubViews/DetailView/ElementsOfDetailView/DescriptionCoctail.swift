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
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(Color.red).opacity(0.8)
                .padding(.horizontal, 20)
            Text("Instruction:")
                .foregroundColor(Color.black)
            Text(coctail.strInstructions)
                .foregroundColor(Color.white)
                .padding(.horizontal, 20)
            
            Text("Ingridients")
                .font(.headline)
                .fontWeight(.bold)
            
            
        }
    }
}

