//
//  RandomCoctailModel.swift
//  CoctailsApp
//
//  Created by Roman on 19/07/2024.
//

import Foundation

struct CoctailModel: Decodable, Equatable {
  
    let drinks: [Drink]
}

struct Drink: Decodable, Equatable {
    let idDrink, strDrink, strCategory, strAlcoholic: String
    let strInstructions: String
    let strDrinkThumb: String?
    let strIngredient1, strIngredient2, strIngredient3: String?
    let strIngredient4, strIngredient5, strIngredient6, strIngredient7: String?
    let strIngredient8, strIngredient9, strIngredient10, strIngredient11: String?
    let strIngredient12, strIngredient13, strIngredient14, strIngredient15: String?
    let strMeasure1, strMeasure2, strMeasure3, strMeasure4: String?
    let strMeasure5, strMeasure6, strMeasure7: String?
    let strMeasure8, strMeasure9, strMeasure10, strMeasure11: String?
    let strMeasure12, strMeasure13, strMeasure14, strMeasure15: String?
 
    static func == (lhs: Drink, rhs: Drink) -> Bool {
            return lhs.idDrink == rhs.idDrink
        }
}
