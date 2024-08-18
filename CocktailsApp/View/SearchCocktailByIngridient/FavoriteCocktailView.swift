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
                if coreDataController.favoriteCocktails.isEmpty {
                    HStack {
                        Text("You don't have favorite cocktails...")
                            .multilineTextAlignment(.center)
                            .font(.Headline2)
                            .foregroundColor(.black.opacity(0.4))
                            .shadow(radius: 3)
                    }

                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.top, UIScreen.main.bounds.height / 2.5)
                } else {
                    ForEach(coreDataController.favoriteCocktails, id: \.idDrink) { cocktail in
                        NavigationLink(destination:
                                        DetailView(
                                            cocktail: cocktail,
                                            widthOfImage: UIScreen.main.bounds.width,
                                            topPadding: 25,
                                            buttonIsHidden: false
                                        )
                        ) {
                            BigElementDrink(cocktail: cocktail)
//                                .swipeActions {
//                                    Button("Delete") {
//                                        
//                                    }
//                                    .tint(.red)
//                                }
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
            .environmentObject(CoreDataController())
    }
}
