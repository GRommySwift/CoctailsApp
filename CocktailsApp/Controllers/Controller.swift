//
//  Controller.swift
//  CocktailsApp
//
//  Created by Roman on 19/07/2024.
//

import SwiftUI
import CoreData

@MainActor
final class Controller: ObservableObject {
    @Published var sixRandomCocktails: [Drink] = []
    @Published var randomCocktail: [Drink] = []
    @Published var searchedCocktailsByName: [Drink] = []
    @Published var errorMessage: String?
    
    
    func clearSearchedCocktails() {
        self.searchedCocktailsByName = []
    }
    
    func fetchRandomCocktail() async {
        do {
            let cocktail = try await NetworkManager.shared.getCocktail(url: URLConstants.randomCocktailURL)
         //   print("Im running - random cocktail")
            randomCocktail = cocktail.drinks
           
        } catch {
            if let error = error as? NetworkError {
                print(error)
            }
        }
    }
    
    func fetchSixRandomCocktails() async {
        var i = 6
        do {
          //  print("Im running - 6 random cocktails")
            while i > 0 {
                let cocktail = try await NetworkManager.shared.getCocktail(url: URLConstants.randomCocktailURL)
                if !sixRandomCocktails.contains(cocktail.drinks) {
                    sixRandomCocktails.append(contentsOf: cocktail.drinks)
                    i -= 1
                } else {
                    print("The same cocktail cant be added to array")
                }
            }
        } catch {
            if let error = error as? NetworkError {
                print(error)
            }
        }
    }
    
    func searchCocktailByName(cocktailName: String) async {
        guard !cocktailName.isEmpty else { return }
        let trimmedString = cocktailName.trimmingCharacters(in: .whitespaces)
        let modifiedString = trimmedString.replacingOccurrences(of: " ", with: "_")
        let url = "\(URLConstants.searchCocktailByNameURL)" + "\(modifiedString.lowercased())"
        Task {
            do {
                let cocktail = try await NetworkManager.shared.getCocktail(url: url)
                self.searchedCocktailsByName = cocktail.drinks
            } catch {
                if let error = error as? NetworkError {
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
