//
//  ContentView.swift
//  CocktailsApp
//
//  Created by Roman on 19/07/2024.
//

import SwiftUI

struct RandomCocktailView: View {
    @StateObject var controller = Controller()
    @ObservedObject var dataController: DataController
    @State private var isLoadedData = false
    var body: some View {
        NavigationView {
            //ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 10) {
                ForEach(controller.randomCocktail, id: \.idDrink) { cocktail in
                    DetailView(widthOfImage: UIScreen.main.bounds.width, topPadding: 25, buttonIsHidden: true, cocktail: cocktail, isFavorite: { dataController.isFavorite(cocktail: cocktail) } , addFavorite: { dataController.addFavorite(cocktail: cocktail) }, removeFavorite: {  dataController.removeFavorite(cocktail: cocktail) })
                        .shadow(radius: 1)
                }
                .refreshable {
                    await controller.fetchRandomCocktail()
                }
            }
            .onAppear {
                if !isLoadedData {
                    Task {
                        await controller.fetchRandomCocktail()
                        isLoadedData = true
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RandomCocktailView(dataController: DataController())
    }
}

