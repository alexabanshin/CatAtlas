//
//  DetailRaitingView.swift
//  CatAtlas
//
//  Created by Alexander Abanshin on 07.10.2025.
//

import UIKit

class DetailRaitingView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension DetailRaitingView {
    func configureViews() {
        backgroundColor = .yellow
    }
    

    
    func configureConstraints() {
   
    }
}
