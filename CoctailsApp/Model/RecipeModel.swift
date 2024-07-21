//
//  RecipeModel.swift
//  CoctailsApp
//
//  Created by Roman on 21/07/2024.
//

import Foundation

struct RecipeModel: Identifiable {
    var id = UUID()
    var ingredients: [String]
    var proportions: [String]
}
