//
//  SearchCocktailByName.swift
//  CocktailsApp
//
//  Created by Roman on 21/07/2024.
//

import SwiftUI

struct SearchCocktailByName: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @StateObject var controller = Controller()
    @StateObject var coreDataController = CoreDataController()
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
                ForEach(controller.searchedCocktailsByName, id: \.idDrink) { cocktail in
                    HStack {
                        NavigationLink(destination: DetailView(cocktail: cocktail, widthOfImage: UIScreen.main.bounds.width, topPadding: 25, buttonIsHidden: false, addFavorite: { coreDataController.addFavorite(cocktail: cocktail, context: managedObjectContext) }, removeFavorite: {  coreDataController.removeFavorite(cocktail: cocktail, context: managedObjectContext) })) {
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
            .environment(\.managedObjectContext, DataController.shared.persistentContainer.viewContext)
    }
}


