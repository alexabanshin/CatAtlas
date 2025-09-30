//
//  NetworkRouter.swift
//  CatAtlas
//
//  Created by Alexander Abanshin on 30.09.2025.
//

import Foundation

enum NetworkRouter {
    static func request(for endpoint: Endpoint) -> URLRequest? {
        guard var urlComponents = URLComponents(string: endpoint.baseURL) else {
            return nil
        }
        
        urlComponents.path = endpoint.path

        guard let url = urlComponents.url else {
            return nil
        }
 
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue(API.apiKey, forHTTPHeaderField: API.headerValue)
        return urlRequest
    }
}
