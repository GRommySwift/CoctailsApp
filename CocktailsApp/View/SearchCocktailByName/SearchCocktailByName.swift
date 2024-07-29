//
//  SearchCocktailByName.swift
//  CocktailsApp
//
//  Created by Roman on 21/07/2024.
//

import SwiftUI

struct SearchCocktailByName: View {
    @StateObject var controller = Controller()
    @State var coreData = CoreDataController()
    @State var inputText: String = ""
    var body: some View {
        NavigationView {
            ScrollView {
                SearchView(searchText: $inputText,
                           clearSearchedCocktails: controller.clearSearchedCocktails,
                           defaultText: "Type the name of cocktail",
                           searchFunction: { query in
                    Task {
                        await controller.searchCocktailByName(cocktailName: query)
                    }
                })
                ForEach(controller.serchedCocktailsByName, id: \.idDrink) { cocktail in
                    HStack {
                        NavigationLink(destination: DetailView(widthOfImage: UIScreen.main.bounds.width, topPadding: 25, buttonIsHidden: false, cocktail: cocktail, isFavorite: { coreData.isFavorite(cocktail: cocktail) } , addFavorite: { coreData.addFavorite(cocktail: cocktail) }, removeFavorite: {  coreData.removeFavorite(cocktail: cocktail) })) {
                            BigElementDrink(cocktail: cocktail)
                        }
                    }
                }
            }
            .background(.linearGradient(Gradient(colors: [.mint.opacity(0.8), .indigo.opacity(0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing))
            
        }
    }
    
}

struct SearchCocktailByName_Previews: PreviewProvider {
    static var previews: some View {
        SearchCocktailByName()
    }
}


