//
//  CocktailsMainView.swift
//  CocktailsApp
//
//  Created by Roman on 21/07/2024.
//

import SwiftUI

struct CocktailsMainView: View {
    @StateObject var controller = Controller()
    @State var coreData = CoreDataController()
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(controller.sixRandomCocktails, id: \.idDrink) { cocktail in
                    NavigationLink(destination: DetailView(widthOfImage: UIScreen.main.bounds.width, topPadding: 25, buttonIsHidden: false, cocktail: cocktail, isFavorite: { coreData.isFavorite(cocktail: cocktail) } , addFavorite: { coreData.addFavorite(cocktail: cocktail) }, removeFavorite: {  coreData.removeFavorite(cocktail: cocktail) })) {
                        BigElementDrink(cocktail: cocktail)
                    }
                }
            }
            .background(.linearGradient(Gradient(colors: [.mint.opacity(0.8), .indigo.opacity(0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing))
        }
    }
    
    

    
}


struct CocktailsMainView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailsMainView()
    }
}

