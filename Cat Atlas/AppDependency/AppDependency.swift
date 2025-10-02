//
//  AppDependency.swift
//  CatAtlas
//
//  Created by Alexander Abanshin on 30.09.2025.
//

import Foundation

struct AppDependency {
    func makeMainView() -> MainViewController {
        let networkService = NetworkService()
        let presenter = MainViewPresenter(networkService: networkService)
        let view = MainViewController(presenter: presenter)
        presenter.view = view
        return view
    }
    
    func makeImageView() -> GalleryViewController {
        GalleryViewController()
    }
    
    func makeBookmarkView() -> BookmarkViewController {
        BookmarkViewController()
        
    }
    
    func makeProfileView() -> ProfileViewController {
        ProfileViewController()
    }
}
