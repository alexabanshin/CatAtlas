//
//  DetailImageView.swift
//  CatAtlas
//
//  Created by Alexander Abanshin on 07.10.2025.
//

import UIKit
import Kingfisher

final class DetailImageView: UIView {
    private let imageView = UIImageView()
    private let breedLabel = UILabel()
    private let temperamentLabel = UILabel()
    private let backButton = BackButton()
    private let saveButton = BookmarkButton()
    
    var onButtonTapped: (() -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with model: DetailUI) {
        self.breedLabel.text = model.breed
        self.temperamentLabel.text = model.temperament
        self.imageView.kf.setImage(with: model.url)
    }
}

private extension DetailImageView {
    func configureViews() {
        [imageView, breedLabel, temperamentLabel, backButton, saveButton].forEach { addView($0) }
        
        configureImageView()
        configureBreedLabel()
        configureDescriptionLabel()
        configureSaveButton()
        configureBackButton()
    }
    
    func configureImageView() {
        imageView.image = UIImage(named: "Pers")

    }
    
    func configureBreedLabel() {
        breedLabel.text = "Pers"
        breedLabel.textAlignment = .center
        breedLabel.font = .custom(.comicNeueBold, size: 25)
    }
    
    func configureDescriptionLabel() {
        temperamentLabel.text = "Active, Energetic, Independent, Intelligent, Gentle"
        temperamentLabel.font = .custom(.comicNeueRegular, size: 18)
        temperamentLabel.textAlignment = .right
        temperamentLabel.numberOfLines = 0
    }
    
    func configureBackButton() {
        backButton.setImage(UIImage(systemName: "chevron.compact.backward"), for: .normal)
        backButton.onButtonTaped = onButtonTapped
    }
    
   
    
    func configureSaveButton() {
        
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            breedLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            breedLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            temperamentLabel.topAnchor.constraint(equalTo: breedLabel.bottomAnchor, constant: 5),
            temperamentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            temperamentLabel.widthAnchor.constraint(equalToConstant: 120),
            
            backButton.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 25),
            backButton.heightAnchor.constraint(equalToConstant: 25),
            
            saveButton.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            saveButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            saveButton.widthAnchor.constraint(equalToConstant: 25),
            saveButton.heightAnchor.constraint(equalToConstant: 25),

        ])
    }
}
