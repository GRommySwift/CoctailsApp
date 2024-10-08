//
//  DetailView.swift
//  CocktailsApp
//
//  Created by Roman on 23/07/2024.
//

import SwiftUI

// Detail information about cocktail, used on all screens

struct DetailView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest private var favorite: FetchedResults<DrinkEntity>
    @EnvironmentObject var coreDataController: CoreDataController
    let widthOfImage: CGFloat
    let topPadding: CGFloat
    let buttonIsHidden: Bool
    let cocktail: Drink
    
    init(cocktail: Drink,
         widthOfImage: CGFloat,
         topPadding: CGFloat,
         buttonIsHidden: Bool
    ) {
        self.cocktail = cocktail
        self.widthOfImage = widthOfImage
        self.topPadding = topPadding
        self.buttonIsHidden = buttonIsHidden
        _favorite = FetchRequest(
            entity: DrinkEntity.entity(),
            sortDescriptors: [],
            predicate: NSPredicate(format: "idDrink == %@", cocktail.idDrink)
        )
    }
    
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            ScrollView(.vertical, showsIndicators: false) {
                CocktailAsyncImage(
                    widthOfImage: widthOfImage,
                    withText: true,
                    cocktail: cocktail
                )
                DescriptionCocktail(cocktail: cocktail)
                Spacer()
                CocktailIngredients(recipe: cocktail.getRecipe())
            }
            .padding(.top, topPadding)
            .toolbar(.hidden, for: .navigationBar)
            .background(.linearGradient(Gradient(colors: [.mint.opacity(0.8), .indigo.opacity(0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing))
            HStack{
                if !buttonIsHidden {
                    BackButtonView()
                        .padding(.leading, 20)
                }
                Spacer()
                FavoriteButton(
                    cocktail: cocktail,
                    isFavorite: !favorite.isEmpty,
                    addFavorite: {
                        coreDataController.addFavorite(cocktail: cocktail, context: managedObjectContext)
                    },
                    removeFavorite: {
                        coreDataController.removeFavorite(cocktail: cocktail, context: managedObjectContext)
                    }
                )
                .padding(.trailing, 20)
                .foregroundColor(.orange)
            }
            
        }
    }
}
