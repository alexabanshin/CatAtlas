//
//  Endpoin.swift
//  CatAtlas
//
//  Created by Alexander Abanshin on 30.09.2025.
//

import Foundation

enum Endpoint {
    case getBreeds
    case getImages
    
    var baseURL: String {
        return API.baseURL
    }
    var path: String {
        switch self {
        case .getBreeds:
            return API.Path.breed
        case .getImages:
            return API.Path.image
        }
    }
}
