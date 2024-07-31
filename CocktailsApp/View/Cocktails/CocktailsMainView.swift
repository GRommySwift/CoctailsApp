//
//  CocktailsMainView.swift
//  CocktailsApp
//
//  Created by Roman on 21/07/2024.
//

import SwiftUI

struct CocktailsMainView: View {
    @StateObject var controller = Controller()
    @ObservedObject var dataController: DataController
    @State private var isDataLoaded = false
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(controller.sixRandomCocktails, id: \.idDrink) { cocktail in
                    NavigationLink(destination: DetailView(widthOfImage: UIScreen.main.bounds.width, topPadding: 25, buttonIsHidden: false, cocktail: cocktail, isFavorite: { dataController.isFavorite(cocktail: cocktail) } , addFavorite: { dataController.addFavorite(cocktail: cocktail) }, removeFavorite: {  dataController.removeFavorite(cocktail: cocktail) })) {
                        BigElementDrink(cocktail: cocktail)
                    }
                }
            }
            .background(.linearGradient(Gradient(colors: [.mint.opacity(0.8), .indigo.opacity(0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing))
        }
        .onAppear {
            if !isDataLoaded {
        Task {
            await controller.fetchSixRandomCocktails()
            isDataLoaded = true
                }
            }
        }
    }
    
    

    
}


struct CocktailsMainView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailsMainView( dataController: DataController())
    }
}

