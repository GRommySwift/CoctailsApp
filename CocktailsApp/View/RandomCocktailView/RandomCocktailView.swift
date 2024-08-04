//
//  ContentView.swift
//  CocktailsApp
//
//  Created by Roman on 19/07/2024.
//

import SwiftUI

struct RandomCocktailView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @StateObject var controller = Controller()
    @StateObject var coreDataController = CoreDataController()
    @State private var isLoadedData = false
    var body: some View {
        NavigationView {
            
            VStack(spacing: 10) {
                ForEach(controller.randomCocktail, id: \.idDrink) { cocktail in
                    DetailView(cocktail: cocktail, widthOfImage: UIScreen.main.bounds.width, topPadding: 25, buttonIsHidden: true, addFavorite: { coreDataController.addFavorite(cocktail: cocktail, context: managedObjectContext) }, removeFavorite: {  coreDataController.removeFavorite(cocktail: cocktail, context: managedObjectContext) })
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
        RandomCocktailView()
            .environment(\.managedObjectContext, DataController.shared.persistentContainer.viewContext)
    }
}

