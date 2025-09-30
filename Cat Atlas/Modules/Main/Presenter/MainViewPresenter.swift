//
//  MainViewPresenter.swift
//  CatAtlas
//
//  Created by Alexander Abanshin on 30.09.2025.
//

import UIKit

protocol MainViewPresenterProtocol {
    var numberOfCell: Int { get }
    func getBreedAt(_ indexPath: IndexPath) -> BreedUI
    
}

protocol MainViewProtocol: AnyObject {
    func reloadData()
    func finishWith(_ error: Error)
}

final class MainViewPresenter: MainViewPresenterProtocol {
    private let networkService: NetworkServiceProtocol
    weak var view: MainViewProtocol?
    
    private var breeds: [BreedUI] = []
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
        loadBreeds()
    }
    
    private func loadBreeds() {
        networkService.fetchBreeds {
            switch $0 {
            case .success(let dtoBreeds):
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    self.breeds = dtoBreeds.map { BreedUI(from: $0) }
                    self.view?.reloadData()
                }
            case .failure(let error):
                self.view?.finishWith(error)
                
            }
            
        }
    }
    
    func getBreedAt(_ indexPath: IndexPath) -> BreedUI {
        return breeds[indexPath.row]
    }
    
    
    var numberOfCell: Int {
        return breeds.count
    }
}
