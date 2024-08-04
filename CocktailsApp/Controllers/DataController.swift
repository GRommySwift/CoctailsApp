//
//  PersistenceController.swift
//  CocktailsApp
//
//  Created by Roman on 28/07/2024.
//

import CoreData

class DataController: NSObject, ObservableObject {
    
    static let shared = DataController()
    private override init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
            let container = NSPersistentContainer(name: "CocktailModel")
            container.loadPersistentStores { (description, error) in
                if let error = error {
                    fatalError("Failed to load Core Data stack: \(error)")
                }
            }
        container.viewContext.automaticallyMergesChangesFromParent = true
        return container
    }()
}
