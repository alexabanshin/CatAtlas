//
//  DetailDescriptionView.swift
//  CatAtlas
//
//  Created by Alexander Abanshin on 07.10.2025.
//

import UIKit

class DetailDescriptionView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


private extension DetailDescriptionView {
    func configureViews() {
        backgroundColor = .red
    }

    func configureConstraints() {
   
    }
}
