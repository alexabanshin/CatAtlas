//
//  Breed.swift
//  CatAtlas
//
//  Created by Alexander Abanshin on 30.09.2025.
//

import Foundation

struct BreedDTO: Codable {
    let weight: Weight
    let id, name: String
    let cfaURL: String?
    let vetstreetURL: String?
    let vcahospitalsURL: String?
    let temperament, origin, countryCodes, countryCode: String
    let description, lifeSpan: String?
    let indoor, lap: Int?
    let altNames: String?
    let adaptability, affectionLevel, childFriendly, dogFriendly: Int?
    let energyLevel, grooming, healthIssues, intelligence: Int?
    let sheddingLevel, socialNeeds, strangerFriendly, vocalisation: Int?
    let experimental, hairless, natural, rare: Int?
    let rex, suppressedTail, shortLegs: Int?
    let wikipediaURL: String?
    let hypoallergenic: Int?
    let referenceImageID: String?
    let image: Image?
}

// MARK: - Image
struct Image: Codable {
    let id: String?
    let width, height: Int?
    let url: String?
}

// MARK: - Weight
struct Weight: Codable {
    let imperial, metric: String?
}

//MARK: - UIModels

///MainScreen UI model
struct BreedUI {
    let id: String
    let origin: String
    let breed: String
    let url: URL?
    
    init(from dto: BreedDTO) {
        self.id = dto.id
        self.origin = dto.origin
        self .breed = dto.name
        
        if let urlString = dto.image?.url, let url = URL(string: urlString) {
            self.url = url
        } else {
            self.url = nil
        }
    }
}

extension BreedUI {
    init(from favorite: FavoriteBreed) {
        self.id = favorite.id ?? UUID().uuidString  
        self.breed = favorite.name ?? "Unknown"
        self.origin = favorite.origin ?? "Unknown"
        if let urlString = favorite.imageURL {
            self.url = URL(string: urlString)
        } else {
            self.url = nil
        }
    }
}

