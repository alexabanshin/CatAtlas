//
//  BreedsColletctionViewController.swift
//  CatAtlas
//
//  Created by Alexander Abanshin on 02.10.2025.
//

import UIKit

class BreedsCollectionViewController: BaseViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, BreedCellDelegate {

    // MARK: - Properties
    var breeds: [BreedUI] = []
    lazy var collectionView = makeCollectionView()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
    }

    // MARK: - Public
    func updateBreeds(_ breeds: [BreedUI]) {
        self.breeds = breeds
        collectionView.reloadData()
    }

    // MARK: - Collection View Setup
    private func makeCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor(hex: "f2e5f1")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(BreedCell.self, forCellWithReuseIdentifier: "cell")
        
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }

    private func setupView() {
        view.addSubview(collectionView)
    }


    private func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        view.bringSubviewToFront(customNavBar)
    }

    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        breeds.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BreedCell
        cell.delegate = self
        cell.update(with: breeds[indexPath.item])
        return cell
    }

    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing: CGFloat = 13
        let totalSpacing: CGFloat = spacing * 3
        let availableWidth = collectionView.bounds.width - totalSpacing
        let itemWidth = availableWidth / 2
        let itemHeight = itemWidth * 1.15
        return CGSize(width: itemWidth, height: itemHeight)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 70, left: 10, bottom: 15, right: 10)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        25
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        10
    }

    // MARK: - Scroll
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        customNavBar.updateAlpha(with: offsetY)
    }
    
    
    // MARK: - BreedCellDelegate
    func didTapBookmark(for breed: BreedUI, isBookmarked: Bool) {
        // Базовое поведение: только добавляем/удаляем из Core Data
        if isBookmarked {
            FavoritesStorage.shared.add(breed)
        } else {
            FavoritesStorage.shared.remove(breed.id)
        }
    }
    
}


