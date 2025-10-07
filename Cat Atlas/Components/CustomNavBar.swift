//
//  CustomNavBar.swift
//  Cat Atlas_UIKit
//
//  Created by Alexander Abanshin on 01.10.2025.
//

import UIKit

final class CustomNavBar: UIView {

    // MARK: - UI Elements
    private(set) var titleLabel = UILabel()
    private(set) var imageView = UIImageView()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    // MARK: - Setup
    private func setupViews() {
        self.translatesAutoresizingMaskIntoConstraints = false
        // Title Label
        titleLabel.font = UIFont(name: "ComicNeue-BoldItalic", size: 40)
        titleLabel.textColor = .purple
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        // Image View
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true

        // Stack
        let stack = UIStackView(arrangedSubviews: [titleLabel, imageView])
        stack.axis = .horizontal
        stack.spacing = 8
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stack)

        // Constraints
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 50),
            imageView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    // MARK: - Scroll Handling
    func updateAlpha(with scrollOffset: CGFloat) {
        // alpha = 1 at offset 0, fades out when scrolling down
        self.alpha = max(0, 1 - scrollOffset / 50)
    }
}
