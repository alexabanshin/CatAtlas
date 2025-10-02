//
//  ImageViewController.swift
//  CatAtlas
//
//  Created by Alexander Abanshin on 01.10.2025.
//

import UIKit

class GalleryViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        
    }
    
    private func configureView() {
        customNavBar.titleLabel.text = "Gallery"
        customNavBar.imageView.image = UIImage(named: "cat")
    }

}
