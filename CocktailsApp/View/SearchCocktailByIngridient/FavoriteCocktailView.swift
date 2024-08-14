//
//  SearchByIngridient.swift
//  CocktailsApp
//
//  Created by Roman on 21/07/2024.
//

import SwiftUI

struct FavoriteCocktailView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @EnvironmentObject var coreDataController: CoreDataController
    @StateObject var controller = Controller()

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                if controller.favoriteCocktails.isEmpty {
                    HStack(alignment: .center) {
                        Text("You don't have favorite cocktails...")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.red.opacity(0.7))
                            .shadow(radius: 5)
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.top, UIScreen.main.bounds.height / 2.5)
                } else {
                    ForEach(controller.favoriteCocktails, id: \.idDrink) { cocktail in
                        NavigationLink(destination:
                                        DetailView(
                                            cocktail: cocktail,
                                            widthOfImage: UIScreen.main.bounds.width,
                                            topPadding: 25,
                                            buttonIsHidden: false
                                        )
                        ) {
                            BigElementDrink(cocktail: cocktail)
                        }
                    }
                }
            }
            .background(.linearGradient(Gradient(colors: [.mint.opacity(0.8), .indigo.opacity(0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .onAppear {
                Task {
                    await controller.favoriteCocktails = coreDataController.fetchFavorites(context: managedObjectContext)
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
