//
//  Persistence.swift
//  CatAtlas
//
//  Created by Alexander Abanshin on 02.10.2025.
//

import Foundation

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "CatAtlas") // имя = xcdatamodeld
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Ошибка загрузки Core Data: \(error)")
            }
        }
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
    }
}
