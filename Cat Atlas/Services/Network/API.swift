//
//  API.swift
//  CatAtlas
//
//  Created by Alexander Abanshin on 30.09.2025.
//

import Foundation

enum API {
    static var apiKey: String {
        guard let key = Bundle.main.object(forInfoDictionaryKey: "CAT_API_KEY") as? String else {
            fatalError("API key not found in Info.plist")
        }
        return key
    }

    static let headerValue = "x-api-key"
    static let baseURL = "https://api.thecatapi.com"
    
    enum Path {
        static let breed = "/v1/breeds"
        static let image = "/v1/images/search"
    }
}
