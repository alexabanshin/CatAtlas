//
//  BookmarkButton.swift
//  CatAtlas
//
//  Created by Alexander Abanshin on 07.10.2025.
//

import UIKit

class BookmarkButton: UIButton {
    private let hitAreaInset: CGFloat = -15
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let largerArea = bounds.insetBy(dx: hitAreaInset, dy: hitAreaInset)
        return largerArea.contains(point)
    }
}

private extension BookmarkButton {
    func configureView() {
        backgroundColor = .white.withAlphaComponent(0.9)
        layer.cornerRadius = 12.5
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.3
        
        addTarget(self, action: #selector(didTabButton), for: .touchUpInside)
    }
}

@objc private extension BookmarkButton {
    func didTabButton() {
        print("Button taped")
    }
}
