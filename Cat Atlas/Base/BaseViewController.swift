//
//  BaseViewController.swift
//  CatAtlas
//
//  Created by Alexander Abanshin on 02.10.2025.
//

import UIKit

class BaseViewController: UIViewController {
    let customNavBar = CustomNavBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "f2e5f1")
        setupCustomNavBar()
    }
    
    private func setupCustomNavBar() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        view.addSubview(customNavBar)
        customNavBar.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            customNavBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            customNavBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customNavBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customNavBar.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
}
