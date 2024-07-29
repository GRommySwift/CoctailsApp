//
//  TabItems.swift
//  CocktailsApp
//
//  Created by Roman on 21/07/2024.
//

import Foundation

enum TabbedItems: Int, CaseIterable{
    case cocktail = 0
    case random
    case searchByName
    case searchByIngridient
    
    var title: String{
        switch self {
        case .cocktail:
            return "Cocktails"
        case .random:
            return "Random"
        case .searchByName:
            return "By name"
        case .searchByIngridient:
            return "Favorite"
        }
    }
    
    var iconName: String{
        switch self {
        case .cocktail:
            return "wine"
        case .random:
            return "random"
        case .searchByName:
            return "search"
        case .searchByIngridient:
            return "star"
        }
    }
}
