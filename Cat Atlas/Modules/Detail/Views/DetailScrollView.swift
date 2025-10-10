//
//  DetailScrollView.swift
//  CatAtlas
//
//  Created by Alexander Abanshin on 07.10.2025.
//

import UIKit

final class DetailScrollView: UIScrollView {
    private let imageView = DetailImageView()
    private let raitingView = DetailRaitingView()
    private let descriptionView = DetailDescriptionView()
    
    var onButtonTapped: (() -> ())? {
        didSet {
            imageView.onButtonTapped = onButtonTapped
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with model: DetailUI) {
        imageView.update(with: model)
    }
}

private extension DetailScrollView {
    func configureViews() {
        [imageView, raitingView, descriptionView].forEach { addView($0) }
        configureDescriptionView()
        configureRatingView()
        configureImageView()
    }
    
    func configureImageView() {
        imageView.backgroundColor = .yellow
        imageView.onButtonTapped = onButtonTapped
    }
    
    func configureRatingView() {
        raitingView.backgroundColor = .blue
       
    }
    
    func configureDescriptionView() {
        descriptionView.backgroundColor = .red
    }
  
    func configureConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentLayoutGuide.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentLayoutGuide.trailingAnchor),
            imageView.widthAnchor.constraint(equalTo: frameLayoutGuide.widthAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 300),

            raitingView.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            raitingView.leadingAnchor.constraint(equalTo: contentLayoutGuide.leadingAnchor),
            raitingView.trailingAnchor.constraint(equalTo: contentLayoutGuide.trailingAnchor),
            raitingView.widthAnchor.constraint(equalTo: frameLayoutGuide.widthAnchor),
            raitingView.heightAnchor.constraint(equalToConstant: 300),

            descriptionView.topAnchor.constraint(equalTo: raitingView.bottomAnchor),
            descriptionView.leadingAnchor.constraint(equalTo: contentLayoutGuide.leadingAnchor),
            descriptionView.trailingAnchor.constraint(equalTo: contentLayoutGuide.trailingAnchor),
            descriptionView.widthAnchor.constraint(equalTo: frameLayoutGuide.widthAnchor),
            descriptionView.heightAnchor.constraint(equalToConstant: 300),
            
            descriptionView.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor)
        ])
    }

    
}
