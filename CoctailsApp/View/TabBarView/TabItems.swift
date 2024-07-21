//
//  TabItems.swift
//  CoctailsApp
//
//  Created by Roman on 21/07/2024.
//

import Foundation

enum TabbedItems: Int, CaseIterable{
    case coctail = 0
    case random
    case searchByName
    case searchByIngridient
    
    var title: String{
        switch self {
        case .coctail:
            return "Coctails"
        case .random:
            return "Random Coctail"
        case .searchByName:
            return "by name"
        case .searchByIngridient:
            return "by ingridient"
        }
    }
    
    var iconName: String{
        switch self {
        case .coctail:
            return "wine"
        case .random:
            return "random"
        case .searchByName:
            return "searchName"
        case .searchByIngridient:
            return "search"
        }
    }
}
