//
//  SearchByIngridient.swift
//  CocktailsApp
//
//  Created by Roman on 21/07/2024.
//

import SwiftUI

struct FavoriteCocktailView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @StateObject var controller = Controller()
    @StateObject var coreDataController = CoreDataController()
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                if coreDataController.favoriteCocktails.isEmpty {
                    
                    HStack(alignment: .center) {
                        Text("You don't have favorite cocktails...")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.red.opacity(0.7))
                            .shadow(radius: 5)
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.top, UIScreen.main.bounds.height / 2.5)
                } else {
                    ForEach(coreDataController.favoriteCocktails, id: \.idDrink) { cocktail in
                        NavigationLink(destination: DetailView(cocktail: cocktail, widthOfImage: UIScreen.main.bounds.width, topPadding: 25, buttonIsHidden: false, addFavorite: { coreDataController.addFavorite(cocktail: cocktail, context: managedObjectContext) }, removeFavorite: {  coreDataController.removeFavorite(cocktail: cocktail, context: managedObjectContext) })) {
                            BigElementDrink(cocktail: cocktail)
                        }
                        
                    }
                }
            }
            .background(.linearGradient(Gradient(colors: [.mint.opacity(0.8), .indigo.opacity(0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .onAppear {
                Task {
                    await coreDataController.favoriteCocktails = coreDataController.fetchFavorites(context: managedObjectContext)
                }
            }
        }
        
    }
    
}


struct SearchByIngridient_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteCocktailView()
            .environment(\.managedObjectContext, DataController.shared.persistentContainer.viewContext)
    }
}
