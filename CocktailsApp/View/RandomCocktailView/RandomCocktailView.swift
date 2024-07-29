//
//  ContentView.swift
//  CocktailsApp
//
//  Created by Roman on 19/07/2024.
//

import SwiftUI

struct RandomCocktailView: View {
    
    @StateObject var controller = Controller()
    @State var coreData = CoreDataController()
    var body: some View {
        NavigationView {
            //ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 10) {
                ForEach(controller.randomCocktail, id: \.idDrink) { cocktail in
                    DetailView(widthOfImage: UIScreen.main.bounds.width, topPadding: 25, buttonIsHidden: true, cocktail: cocktail, isFavorite: { coreData.isFavorite(cocktail: cocktail) } , addFavorite: { coreData.addFavorite(cocktail: cocktail) }, removeFavorite: {  coreData.removeFavorite(cocktail: cocktail) })
                        .shadow(radius: 1)
                }
                .refreshable {
                    await controller.fetchRandomCocktail()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RandomCocktailView()
    }
}

