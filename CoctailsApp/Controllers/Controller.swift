//
//  Controller.swift
//  CoctailsApp
//
//  Created by Roman on 19/07/2024.
//

import SwiftUI

@MainActor
final class Controller: ObservableObject {
    
    @Published var randomCoctail: [Drink] = []
    @Published var recipe: RecipeModel = RecipeModel(ingredients: [], proportions: [])
    
    init() {
        fetchRandomCoctail()
       
    }
    
    func fetchRandomCoctail() {
        Task {
            do {
                let coctail = try await NetworkManager.shared.getCoctails(url: URLConstans.randomCoctailURL)
                randomCoctail = coctail.drinks
                recipe = parseAndFilterRecipe(from: randomCoctail)
            } catch {
                if let error = error as? NetworkError {
                    print(error)
                }
            }
        }
    }
    
    func parseAndFilterRecipe(from networkData: [Drink]) -> RecipeModel {
        var ingredients: [String] = []
            var proportions: [String] = []
            
            for recipeData in networkData {
                let mirror = Mirror(reflecting: recipeData)
                
                for i in 1...15 {
                    let ingredientKey = "strIngredient\(i)"
                    let proportionKey = "strMeasure\(i)"
                    
                    let ingredient = mirror.children.first { $0.label == ingredientKey }?.value as? String
                    let proportion = mirror.children.first { $0.label == proportionKey }?.value as? String
                    
                    if let ingredient = ingredient, let proportion = proportion {
                        ingredients.append(ingredient)
                        print("Ingridients - \(ingredients)")
                        proportions.append(proportion)
                        print("Proportion - \(proportion)")
                    }
                }
            }
            
            return RecipeModel(ingredients: ingredients, proportions: proportions)
    }

    
}
