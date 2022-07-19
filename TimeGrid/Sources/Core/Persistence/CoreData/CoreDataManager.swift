//
//  CoreDataManager.swift
//  TimeGrid
//
//  Created by Chris J on 17/07/2022.
//

import CoreData

public class CoreDataManager {

    public static let instance: CoreDataManager = { CoreDataManager() }()
    let container: NSPersistentContainer

    private init() {
        container = NSPersistentContainer(name: "TimeGrid")

        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                print("Unresolved error \(error)")
            }
        }
    }

    func saveContext() {
        if container.viewContext.hasChanges {
            do {
                try container.viewContext.save()
            } catch {
                print("An error occurred while saving: \(error)")
            }
        }
    }
}
