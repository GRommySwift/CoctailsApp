//
//  PersistenceController.swift
//  CocktailsApp
//
//  Created by Roman on 28/07/2024.
//

import CoreData

class DataController: NSObject, ObservableObject {
    
    //static let shared = PersistenceController()
    
    let container: NSPersistentContainer

    override init() {
        container = NSPersistentContainer(name: "CocktailModel")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
        }
    }
    
    func addFavorite(cocktail: Drink) {
        let context = container.viewContext
        let drinkEntity = DrinkEntity(context: context)
        drinkEntity.idDrink = cocktail.idDrink
        drinkEntity.strDrink = cocktail.strDrink
        drinkEntity.strCategory = cocktail.strCategory
        drinkEntity.strAlcoholic = cocktail.strAlcoholic
        drinkEntity.strInstructions = cocktail.strInstructions
        drinkEntity.strDrinkThumb = cocktail.strDrinkThumb
        drinkEntity.strIngredient1 = cocktail.strIngredient1
        drinkEntity.strIngredient2 = cocktail.strIngredient2
        drinkEntity.strIngredient3 = cocktail.strIngredient3
        drinkEntity.strIngredient4 = cocktail.strIngredient4
        drinkEntity.strIngredient5 = cocktail.strIngredient5
        drinkEntity.strIngredient6 = cocktail.strIngredient6
        drinkEntity.strIngredient7 = cocktail.strIngredient7
        drinkEntity.strIngredient8 = cocktail.strIngredient8
        drinkEntity.strIngredient9 = cocktail.strIngredient9
        drinkEntity.strIngredient10 = cocktail.strIngredient10
        drinkEntity.strIngredient11 = cocktail.strIngredient11
        drinkEntity.strIngredient12 = cocktail.strIngredient12
        drinkEntity.strIngredient13 = cocktail.strIngredient13
        drinkEntity.strIngredient14 = cocktail.strIngredient14
        drinkEntity.strIngredient15 = cocktail.strIngredient15
        drinkEntity.strMeasure1 = cocktail.strMeasure1
        drinkEntity.strMeasure2 = cocktail.strMeasure2
        drinkEntity.strMeasure3 = cocktail.strMeasure3
        drinkEntity.strMeasure4 = cocktail.strMeasure4
        drinkEntity.strMeasure5 = cocktail.strMeasure5
        drinkEntity.strMeasure6 = cocktail.strMeasure6
        drinkEntity.strMeasure7 = cocktail.strMeasure7
        drinkEntity.strMeasure8 = cocktail.strMeasure8
        drinkEntity.strMeasure9 = cocktail.strMeasure9
        drinkEntity.strMeasure10 = cocktail.strMeasure10
        drinkEntity.strMeasure11 = cocktail.strMeasure11
        drinkEntity.strMeasure12 = cocktail.strMeasure12
        drinkEntity.strMeasure13 = cocktail.strMeasure13
        drinkEntity.strMeasure14 = cocktail.strMeasure14
        drinkEntity.strMeasure15 = cocktail.strMeasure15
        do {
            try context.save()
        } catch {
            print("Failed to save favorite drink: \(error)")
        }
    }
    
    func removeFavorite(cocktail: Drink) {
        let context = container.viewContext
        let fetchRequest: NSFetchRequest<DrinkEntity> = DrinkEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "idDrink == %@", cocktail.idDrink)
        
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
    
    func isFavorite(cocktail: Drink) -> Bool {
        let context = container.viewContext
        let fetchRequest: NSFetchRequest<DrinkEntity> = DrinkEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "idDrink == %@", cocktail.idDrink)
        
        do {
            let count = try context.count(for: fetchRequest)
            return count > 0
        } catch {
            print("Failed to fetch favorite drink: \(error)")
            return false
        }
    }
    
    func fetchFavorites() async -> [Drink] {
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
}
