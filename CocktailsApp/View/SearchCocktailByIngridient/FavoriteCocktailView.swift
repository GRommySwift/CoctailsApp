//
//  SearchByIngridient.swift
//  CocktailsApp
//
//  Created by Roman on 21/07/2024.
//

import SwiftUI

struct FavoriteCocktailView: View {
    
    @StateObject var controller = Controller()
    @ObservedObject var dataController: DataController
    @State private var favoriteCocktails: [Drink] = []
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                if favoriteCocktails.isEmpty {
                    
                    HStack(alignment: .center) {
                        Text("You dont have favorite cocktails...")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.red.opacity(0.7))
                            .shadow(radius: 5)
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.top, UIScreen.main.bounds.height / 2.5)
                } else {
                    ForEach(favoriteCocktails, id: \.idDrink) { cocktail in
                        NavigationLink(destination: DetailView(widthOfImage: UIScreen.main.bounds.width, topPadding: 25, buttonIsHidden: false, cocktail: cocktail, isFavorite: { dataController.isFavorite(cocktail: cocktail) } , addFavorite: { dataController.addFavorite(cocktail: cocktail) }, removeFavorite: {  dataController.removeFavorite(cocktail: cocktail) })) {
                            BigElementDrink(cocktail: cocktail)
                        }
                        
                    }
                }
            }
            .background(.linearGradient(Gradient(colors: [.mint.opacity(0.8), .indigo.opacity(0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .onAppear {
                Task {
                    await favoriteCocktails = dataController.fetchFavorites()
                }
            }
        }
        
    }
    

}

struct SearchByIngridient_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteCocktailView(dataController: DataController())
    }
}
