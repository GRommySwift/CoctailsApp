//
//  BigElement.swift
//  CoctailsApp
//
//  Created by Roman on 24/07/2024.
//

import SwiftUI

// Large tile with image, name of coctail and category of coctail.
// This is the element of UI which used on main screen and search screen's

struct BigElementDrink: View {
    let coctail: Drink
    var body: some View {
        HStack {
            VStack {
                CoctailAsyncImage(widthOfImage: UIScreen.main.bounds.width / 2.5, withText: false, coctail: coctail)
            }
            VStack {
                Text(coctail.strDrink)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
                Text("Category - \(coctail.strCategory)" + " " + "(\(coctail.strAlcoholic))")
                    .font(.system(size: 16))
                    .italic()
                    .fontWeight(.bold)
                    .foregroundColor(Color.red.opacity(0.8))
            }
            .frame(width: UIScreen.main.bounds.width / 2)
            
        }
        .background(.green.opacity(0.3)).cornerRadius(40)
        .shadow(radius: 6)
        .padding(.horizontal, 20)
    }
}
