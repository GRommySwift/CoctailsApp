//
//  Controller.swift
//  CoctailsApp
//
//  Created by Roman on 19/07/2024.
//

import SwiftUI
import CoreData

@MainActor
final class Controller: ObservableObject {
    @Published var isLoading = false
    @Published var sixRandomCoctails: [Drink] = []
    @Published var randomCoctail: [Drink] = []
    @Published var serchedCoctailsByName: [Drink] = []
    @Published var recipe: RecipeModel = RecipeModel(ingredients: [], proportions: [])
    @Published var errorMessage: String?
    private let container: NSPersistentContainer
    
    init() {
        container = PersistenceController.shared.container
        fetchRandomCoctail()
        fetchSixRandomCoctails()
        
    }
    
    func clearSearchedCoctails() {
        DispatchQueue.main.async {
            self.serchedCoctailsByName = []
        }
    }
    
    func addFavorite(coctail: Drink) {
        let context = container.viewContext
        let drinkEntity = DrinkEntity(context: context)
        drinkEntity.idDrink = coctail.idDrink
        drinkEntity.strDrink = coctail.strDrink
        drinkEntity.strCategory = coctail.strCategory
        drinkEntity.strAlcoholic = coctail.strAlcoholic
        drinkEntity.strInstructions = coctail.strInstructions
        drinkEntity.strDrinkThumb = coctail.strDrinkThumb
        drinkEntity.strIngredient1 = coctail.strIngredient1
        drinkEntity.strIngredient2 = coctail.strIngredient2
        drinkEntity.strIngredient3 = coctail.strIngredient3
        drinkEntity.strIngredient4 = coctail.strIngredient4
        drinkEntity.strIngredient5 = coctail.strIngredient5
        drinkEntity.strIngredient6 = coctail.strIngredient6
        drinkEntity.strIngredient7 = coctail.strIngredient7
        drinkEntity.strIngredient8 = coctail.strIngredient8
        drinkEntity.strIngredient9 = coctail.strIngredient9
        drinkEntity.strIngredient10 = coctail.strIngredient10
        drinkEntity.strIngredient11 = coctail.strIngredient11
        drinkEntity.strIngredient12 = coctail.strIngredient12
        drinkEntity.strIngredient13 = coctail.strIngredient13
        drinkEntity.strIngredient14 = coctail.strIngredient14
        drinkEntity.strIngredient15 = coctail.strIngredient15
        drinkEntity.strMeasure1 = coctail.strMeasure1
        drinkEntity.strMeasure2 = coctail.strMeasure2
        drinkEntity.strMeasure3 = coctail.strMeasure3
        drinkEntity.strMeasure4 = coctail.strMeasure4
        drinkEntity.strMeasure5 = coctail.strMeasure5
        drinkEntity.strMeasure6 = coctail.strMeasure6
        drinkEntity.strMeasure7 = coctail.strMeasure7
        drinkEntity.strMeasure8 = coctail.strMeasure8
        drinkEntity.strMeasure9 = coctail.strMeasure9
        drinkEntity.strMeasure10 = coctail.strMeasure10
        drinkEntity.strMeasure11 = coctail.strMeasure11
        drinkEntity.strMeasure12 = coctail.strMeasure12
        drinkEntity.strMeasure13 = coctail.strMeasure13
        drinkEntity.strMeasure14 = coctail.strMeasure14
        drinkEntity.strMeasure15 = coctail.strMeasure15
        do {
            try context.save()
        } catch {
            print("Failed to save favorite drink: \(error)")
        }
    }
    
    func removeFavorite(coctail: Drink) {
        let context = container.viewContext
        let fetchRequest: NSFetchRequest<DrinkEntity> = DrinkEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "idDrink == %@", coctail.idDrink)
        
        do {
            let results = try context.fetch(fetchRequest)
            for result in results {
                context.delete(result)
            }
            try context.save()
        } catch {
            print("Failed to delete favorite drink: \(error)")
        }
    }
    
    func isFavorite(coctail: Drink) -> Bool {
        let context = container.viewContext
        let fetchRequest: NSFetchRequest<DrinkEntity> = DrinkEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "idDrink == %@", coctail.idDrink)
        
        do {
            let count = try context.count(for: fetchRequest)
            return count > 0
        } catch {
            print("Failed to fetch favorite drink: \(error)")
            return false
        }
    }
    
    func fetchFavorites() -> [Drink] {
        let context = container.viewContext
        let fetchRequest: NSFetchRequest<DrinkEntity> = DrinkEntity.fetchRequest()
        
        do {
            let results = try context.fetch(fetchRequest)
            return results.map { drinkEntity in
                Drink(
                    idDrink: drinkEntity.idDrink ?? "",
                    strDrink: drinkEntity.strDrink ?? "",
                    strCategory: drinkEntity.strCategory ?? "",
                    strAlcoholic: drinkEntity.strAlcoholic ?? "",
                    strInstructions: drinkEntity.strInstructions ?? "",
                    strDrinkThumb: drinkEntity.strDrinkThumb ?? "",
                    strIngredient1: drinkEntity.strIngredient1 ?? "",
                    strIngredient2: drinkEntity.strIngredient2 ?? "",
                    strIngredient3: drinkEntity.strIngredient3 ?? "",
                    strIngredient4: drinkEntity.strIngredient4 ?? "",
                    strIngredient5: drinkEntity.strIngredient5 ?? "",
                    strIngredient6: drinkEntity.strIngredient6 ?? "",
                    strIngredient7: drinkEntity.strIngredient7 ?? "",
                    strIngredient8: drinkEntity.strIngredient8 ?? "",
                    strIngredient9: drinkEntity.strIngredient9 ?? "",
                    strIngredient10: drinkEntity.strIngredient10 ?? "",
                    strIngredient11: drinkEntity.strIngredient11 ?? "",
                    strIngredient12: drinkEntity.strIngredient12 ?? "",
                    strIngredient13: drinkEntity.strIngredient13 ?? "",
                    strIngredient14: drinkEntity.strIngredient14 ?? "",
                    strIngredient15: drinkEntity.strIngredient15 ?? "",
                    strMeasure1: drinkEntity.strMeasure1 ?? "",
                    strMeasure2: drinkEntity.strMeasure2 ?? "",
                    strMeasure3: drinkEntity.strMeasure3 ?? "",
                    strMeasure4: drinkEntity.strMeasure4 ?? "",
                    strMeasure5: drinkEntity.strMeasure5 ?? "",
                    strMeasure6: drinkEntity.strMeasure6 ?? "",
                    strMeasure7: drinkEntity.strMeasure7 ?? "",
                    strMeasure8: drinkEntity.strMeasure8 ?? "",
                    strMeasure9: drinkEntity.strMeasure9 ?? "",
                    strMeasure10: drinkEntity.strMeasure10 ?? "",
                    strMeasure11: drinkEntity.strMeasure11 ?? "",
                    strMeasure12: drinkEntity.strMeasure12 ?? "",
                    strMeasure13: drinkEntity.strMeasure13 ?? "",
                    strMeasure14: drinkEntity.strMeasure14 ?? "",
                    strMeasure15: drinkEntity.strMeasure15  ?? ""
                )
            }
        } catch {
            print("Failed to fetch favorite drinks: \(error)")
            return []
        }
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

func fetchSixRandomCoctails() {
    var i = 6
    Task{
        do {
            while i > 0 {
                let coctail = try await NetworkManager.shared.getCoctails(url: URLConstans.randomCoctailURL)
                if !sixRandomCoctails.contains(coctail.drinks) {
                    sixRandomCoctails.append(contentsOf: coctail.drinks)
                    i -= 1
                } else {
                    print("The same coctail cant be added to array")
                }
            }
            isLoading = false
        } catch {
            if let error = error as? NetworkError {
                print(error)
            }
        }
    }
}

func searchCoctailByName(coctailName: String) {
    guard !coctailName.isEmpty else { return }
    let trimmedString = coctailName.trimmingCharacters(in: .whitespaces)
    let modifiedString = trimmedString.replacingOccurrences(of: " ", with: "_")
    let url = "\(URLConstans.searchCoctailByNameURL)" + "\(modifiedString.lowercased())"
    Task {
        do {
            let coctail = try await NetworkManager.shared.getCoctails(url: url)
            self.serchedCoctailsByName = coctail.drinks
        } catch {
            if let error = error as? NetworkError {
                self.errorMessage = error.localizedDescription
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
                proportions.append(proportion)
            }
        }
    }
    
    return RecipeModel(ingredients: ingredients, proportions: proportions)
}


}
