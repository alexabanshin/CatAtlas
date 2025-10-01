//
//  MainCell.swift
//  Cat Atlas_UIKit
//
//  Created by Alexander Abanshin on 30.09.2025.
//


import UIKit
import Kingfisher

final class MainCell: BaseCollectionCell {
    private let imageView = UIImageView()
    private let originLabel = UILabel()
    private let breedLabel = UILabel()
    private let labelsStack = UIStackView()
    private let bookmarkButton = UIButton()
    
    private var isBookmarked = false
    
     override func setupViews() {
        setupImageView()
        setupLabelsStack()
        setupContentView()
        setupBookmarkButton()
        configureConstraints()
    }
    
 //MARK:  Update from api
    func update(with model: BreedUI) {
        self.breedLabel.text = model.breed
        self.originLabel.text = model.origin
        imageView.kf.setImage(with: model.url, placeholder: UIImage(named: "default"))
    }
    
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.2) {
                self.transform = self.isHighlighted ? CGAffineTransform(scaleX: 0.97, y: 0.97) : .identity
                self.layer.shadowOpacity = self.isHighlighted ? 0.2 : 0.1
            }
        }
    }
}
// MARK: - Congigure UI

private extension MainCell {
    
    func setupContentView() {
        backgroundColor = .white
        layer.cornerRadius = 15
        layer.masksToBounds = false
        translatesAutoresizingMaskIntoConstraints = false
    }
    
     func setupImageView() {
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
    }
    
    func setupLabelsStack() {
        breedLabel.font = UIFont(name: "ComicNeue-BoldItalic", size: 18)
        breedLabel.textColor = .systemBrown
        originLabel.font = UIFont(name: "ComicNeue-Light", size: 14)
        originLabel.textColor = .darkGray
    
        labelsStack.axis = .vertical
        labelsStack.spacing = 4
        labelsStack.alignment = .leading
        labelsStack.translatesAutoresizingMaskIntoConstraints = false
        labelsStack.addArrangedSubview(breedLabel)
        labelsStack.addArrangedSubview(originLabel)
        contentView.addSubview(labelsStack)
    }
  
    func setupBookmarkButton() {
        bookmarkButton.translatesAutoresizingMaskIntoConstraints = false
        
        bookmarkButton.setImage(UIImage(named: "bookmark"), for: .normal)
        bookmarkButton.setImage(UIImage(named: "paw2"), for: .selected)
        
        bookmarkButton.backgroundColor = .white.withAlphaComponent(0.9)
        bookmarkButton.layer.cornerRadius = 12.5
        bookmarkButton.layer.shadowColor = UIColor.black.cgColor
        bookmarkButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        bookmarkButton.layer.shadowRadius = 4
        bookmarkButton.layer.shadowOpacity = 0.3
        
        bookmarkButton.addTarget(self, action: #selector(didTapBookmarkButton), for: .touchUpInside)
        
        contentView.addSubview(bookmarkButton)
    }
    
    @objc func didTapBookmarkButton() {
        UIView.animate(withDuration: 0.2, animations: {
            self.bookmarkButton.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }) { _ in
            UIView.animate(withDuration: 0.2) {
                self.bookmarkButton.transform = .identity
            }
        }
        
        isBookmarked.toggle()
        bookmarkButton.isSelected = isBookmarked
        
//         Можно добавить дополнительную анимацию
        if isBookmarked {
            animateBookmarkSelection()
        }
        
        // Уведомляем делегата или используем closure для передачи события
//         delegate?.didTapBookmark(in: self)
        // или
//         onBookmarkTapped?(isBookmarked)
    }
    
    private func animateBookmarkSelection() {
        let pulseAnimation = CABasicAnimation(keyPath: "transform.scale")
        pulseAnimation.duration = 0.2
        pulseAnimation.fromValue = 1.0
        pulseAnimation.toValue = 1.3
        pulseAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        pulseAnimation.autoreverses = true
        pulseAnimation.repeatCount = 1
        
        bookmarkButton.layer.add(pulseAnimation, forKey: "pulse")
    }
    
    // Метод для внешнего обновления состояния
    func updateBookmarkState(_ isBookmarked: Bool) {
        self.isBookmarked = isBookmarked
        bookmarkButton.isSelected = isBookmarked
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 3),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -3),
            imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7),
            
            labelsStack.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            labelsStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            labelsStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            labelsStack.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8),
            
            bookmarkButton.heightAnchor.constraint(equalToConstant: 25),
            bookmarkButton.widthAnchor.constraint(equalToConstant: 25),
            bookmarkButton.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 8),
            bookmarkButton.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -8)
        ])
    }
}
