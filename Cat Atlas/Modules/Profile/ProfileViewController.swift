//
//  ProfileViewController.swift
//  CatAtlas
//
//  Created by Alexander Abanshin on 01.10.2025.
//

import UIKit

class ProfileViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        
    }
    
    private func configureView() {
        customNavBar.titleLabel.text = "Profile"
        customNavBar.imageView.image = UIImage(named: "cat")
    }


}
