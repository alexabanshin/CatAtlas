//
//  FavoritesStorage.swift
//  CatAtlas
//
//  Created by Alexander Abanshin on 02.10.2025.
//

import CoreData

final class FavoritesStorage {
    static let shared = FavoritesStorage()
    private let context = PersistenceController.shared.container.viewContext
    
    private init() {}
    
    // Добавить породу
    func add(_ dto: BreedDTO) {
        // проверим, что нет дубликата
        if fetch().contains(where: { $0.id == dto.id }) { return }
        
        let breed = FavoriteBreed(context: context)
        breed.id = dto.id
        breed.name = dto.name
        breed.origin = dto.origin
        breed.imageURL = dto.image?.url 
        saveContext()
    }
    
    // Удалить породу
    func remove(_ id: String) {
        let request: NSFetchRequest<FavoriteBreed> = FavoriteBreed.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", id)
        
        if let result = try? context.fetch(request).first {
            context.delete(result)
            saveContext()
        }
    }
    
    // Получить все избранные
    func fetch() -> [FavoriteBreed] {
        let request: NSFetchRequest<FavoriteBreed> = FavoriteBreed.fetchRequest()
        return (try? context.fetch(request)) ?? []
    }
    
    // Сохранение изменений
    private func saveContext() {
        if context.hasChanges {
            try? context.save()
        }
    }
}

