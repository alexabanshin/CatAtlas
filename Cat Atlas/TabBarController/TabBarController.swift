//
//  TabBarController.swift
//  CatAtlas
//
//  Created by Alexander Abanshin on 01.10.2025.
//

import UIKit

enum Tab: String, CaseIterable {
    case home, gallery, bookmark, profile
}

final class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabs()
    }
    
    
    
    
    private func setTabs() {
        setViewControllers(configureControllers(), animated: true)
    }
    
    private func configureControllers() -> [UIViewController] {
        Tab.allCases.map {
            let controller = controllerAt($0)
            controller.tabBarItem.title = $0.rawValue.capitalized
            controller.tabBarItem.image = UIImage(named: $0.rawValue)?.resized(to: CGSize(width: 25, height: 25))

            return controller
        }
    }
    
    private func controllerAt(_ tab: Tab) -> UINavigationController {
        switch tab {
        case .home:
            return UINavigationController(rootViewController: AppDependency().makeMainView())
        case .gallery:
            return UINavigationController(rootViewController: AppDependency().makeImageView())
        case .bookmark:
            return UINavigationController(rootViewController: AppDependency().makeBookmarkView())
        case .profile:
            return UINavigationController(rootViewController: AppDependency().makeProfileView())
        }
    }
 
}

