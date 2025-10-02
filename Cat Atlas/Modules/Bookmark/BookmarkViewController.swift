//
//  BookmarkViewController.swift
//  CatAtlas
//
//  Created by Alexander Abanshin on 01.10.2025.
//

import UIKit

class BookmarkViewController: BreedsCollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        update()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        update() 
    }

    
    private func configureView() {
        customNavBar.titleLabel.text = "Bookmarks"
        customNavBar.imageView.image = UIImage(named: "cat")
    }
    
    private func update() {
        let favorites = FavoritesStorage.shared.fetch()
        let breedUI = favorites.map { BreedUI(from: $0) }
        updateBreeds(breedUI)
    }
    
    // MARK: - BreedCellDelegate
    override func didTapBookmark(for breed: BreedUI, isBookmarked: Bool) {
         // Удаляем только на экране закладок
         FavoritesStorage.shared.remove(breed.id)
         if let index = breeds.firstIndex(where: { $0.id == breed.id }) {
             breeds.remove(at: index)
             collectionView.performBatchUpdates {
                 collectionView.deleteItems(at: [IndexPath(item: index, section: 0)])
             }
         }
     }

     // В cellForItemAt нужно назначить delegate
     override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BreedCell
         cell.delegate = self // важное отличие для закладок
         cell.update(with: breeds[indexPath.item])
         return cell
     }

}

