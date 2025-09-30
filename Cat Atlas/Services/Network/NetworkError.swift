//
//  NetworkError.swift
//  CatAtlas
//
//  Created by Alexander Abanshin on 30.09.2025.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidRequest
    case invalidResponse(statusCode: Int)
    case decodingFailed(Error)
    case connectionFailed(Error)
    case noData
    
    var errorDescription: String? {
        switch self {
        case .invalidRequest:
            return "Invalid request URL or parameters"
        case .invalidResponse(let statusCode):
            return "Server returned unexpected status code: \(statusCode)"
        case .decodingFailed(let error):
            return "Failed to decode response: \(error.localizedDescription)"
        case .connectionFailed(let error):
            return "Network connection failed: \(error.localizedDescription)"
        case .noData:
            return "Server returned no data"
        }
    }
}
