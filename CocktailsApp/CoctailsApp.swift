//
//  CocktailsAppApp.swift
//  CocktailsApp
//
//  Created by Roman on 19/07/2024.
//

import SwiftUI

@main
struct CocktailsApp: App {
    var coreDataController = CoreDataController()
    
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environment(\.managedObjectContext, DataController.shared.persistentContainer.viewContext)
                .environmentObject(coreDataController)
        }
    }
}
