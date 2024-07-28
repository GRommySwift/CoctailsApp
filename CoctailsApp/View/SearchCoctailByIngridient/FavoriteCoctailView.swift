//
//  SearchByIngridient.swift
//  CoctailsApp
//
//  Created by Roman on 21/07/2024.
//

import SwiftUI

struct FavoriteCoctailView: View {
    
    @StateObject var controller = Controller()
    @State private var favoriteCoctails: [Drink] = []
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(favoriteCoctails, id: \.idDrink) { coctail in
                    NavigationLink(destination: DetailView(widthOfImage: UIScreen.main.bounds.width, topPadding: 25, buttonIsHidden: false, coctail: coctail, isFavorite: { controller.isFavorite(coctail: coctail) } , addFavorite: { controller.addFavorite(coctail: coctail) }, removeFavorite: {  controller.removeFavorite(coctail: coctail) })) {
                        BigElementDrink(coctail: coctail)
                    }
                }
            }
            .background(.linearGradient(Gradient(colors: [.mint.opacity(0.8), .indigo.opacity(0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .onAppear {
                favoriteCoctails = controller.fetchFavorites()
            }
        }
        .background(.linearGradient(Gradient(colors: [.mint.opacity(0.8), .indigo.opacity(0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct SearchByIngridient_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteCoctailView()
    }
}
