//
//  CocktailsMainView.swift
//  CocktailsApp
//
//  Created by Roman on 21/07/2024.
//

import SwiftUI

struct CocktailsMainView: View {
    
    @StateObject var controller = Controller()
    
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(controller.sixRandomCocktails, id: \.idDrink) { cocktail in
                    cocktailCardButton(cocktail: cocktail)
                }
            }
            .background(.customBackgroundColor)
        }
    }
}

// MARK: - View components

private extension CocktailsMainView {
    func cocktailCardButton(cocktail: Drink) -> some View {
        NavigationLink(
            destination: DetailView(
                cocktail: cocktail,
                widthOfImage: UIScreen.main.bounds.width,
                topPadding: 25,
                buttonIsHidden: false)
        ) {
            BigElementDrink(cocktail: cocktail)
        }
    }
}

struct CocktailsMainView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailsMainView()
            .environment(\.managedObjectContext, DataController.shared.persistentContainer.viewContext)
    }
}
