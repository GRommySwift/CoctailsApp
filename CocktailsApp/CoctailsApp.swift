//
//  CocktailsAppApp.swift
//  CocktailsApp
//
//  Created by Roman on 19/07/2024.
//

import SwiftUI

@main
struct CocktailsApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            TabBarView(dataController: dataController)
                .environmentObject(dataController)
        }
    }
}
