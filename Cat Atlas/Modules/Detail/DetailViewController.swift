//
//  DetailViewController.swift
//  CatAtlas
//
//  Created by Alexander Abanshin on 01.10.2025.
//

import UIKit

protocol DetailViewProtocol: AnyObject {
    func update(with model: DetailUI)
}

final class DetailViewController: UIViewController, DetailViewProtocol {
    private let presenter: DetailPresenter
    private let detailScrollView = DetailScrollView()

    init(presenter: DetailPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        configureConstraints()
    }
    
    func update(with model: DetailUI) {
        detailScrollView.update(with: model)
    }
}

private extension DetailViewController {
    func configureViews() {
        configureScrollView()
        
        detailScrollView.onButtonTapped = {
            print("taped")
        }
    }
    
    func configureScrollView() {
        view.addView(detailScrollView)
        detailScrollView.contentInsetAdjustmentBehavior = .never // Что бы imageView был без отступов от safe area
    }
    
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            detailScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            detailScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}
