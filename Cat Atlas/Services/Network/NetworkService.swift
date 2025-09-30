//
//  NetworkService.swift
//  CatAtlas
//
//  Created by Alexander Abanshin on 30.09.2025.
//

import Foundation
import os

protocol NetworkServiceProtocol {
    func fetchBreeds(completion: @escaping (Result<[BreedDTO], NetworkError>) -> ())
    func fetchImages(completion: @escaping (Result<[Image], NetworkError>) -> ())
}

class NetworkService {
    
    private func fetch<T: Decodable>(_ endpoint: Endpoint, _ completion: @escaping (Result<T, NetworkError>) -> ()) {
        guard let urlRequest = NetworkRouter.request(for: endpoint) else {
            completion(.failure(NetworkError.invalidRequest))
            return
        }
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            if let error = error {
                completion(.failure(NetworkError.connectionFailed(error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse(statusCode: -1)))
                return
            }

            guard (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.invalidResponse(statusCode: httpResponse.statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.invalidRequest))
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(.decodingFailed(error)))
            }
            
        }.resume()
    }
}

extension NetworkService: NetworkServiceProtocol {
    func fetchBreeds(completion: @escaping (Result<[BreedDTO], NetworkError>) -> ()) {
        fetch(Endpoint.getBreeds, completion)
    }
    
    func fetchImages(completion: @escaping (Result<[Image], NetworkError>) -> ()) {
        fetch(Endpoint.getImages, completion)
    }
}
