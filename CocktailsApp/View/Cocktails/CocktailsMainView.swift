//
//  CocktailsMainView.swift
//  CocktailsApp
//
//  Created by Roman on 21/07/2024.
//

import SwiftUI

struct CocktailsMainView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @StateObject var controller = Controller()
    @StateObject var coreDataController = CoreDataController()
    @State private var isDataLoaded = false
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(controller.sixRandomCocktails, id: \.idDrink) { cocktail in
                    NavigationLink(destination: DetailView(cocktail: cocktail, widthOfImage: UIScreen.main.bounds.width, topPadding: 25, buttonIsHidden: false, addFavorite: { coreDataController.addFavorite(cocktail: cocktail, context: managedObjectContext) }, removeFavorite: {  coreDataController.removeFavorite(cocktail: cocktail, context: managedObjectContext) })) {
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
        CocktailsMainView()
            .environment(\.managedObjectContext, DataController.shared.persistentContainer.viewContext)
    }
}

