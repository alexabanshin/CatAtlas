//
//  ViewController.swift
//  Cat Atlas_UIKit
//
//  Created by Alexander Abanshin on 30.09.2025.
//

import UIKit

final class MainViewController: UIViewController {
    private let presenter: MainViewPresenterProtocol
    
    init(presenter: MainViewPresenterProtocol) {
        self.presenter = presenter
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
       let collecction = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collecction.delegate = self
        collecction.dataSource = self
        collecction.register(MainCell.self, forCellWithReuseIdentifier: "cell")
        return collecction
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        
    }

}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.numberOfCell
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MainCell
        cell.update(with: presenter.getBreedAt(indexPath))
        return cell
    }
    
    
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing: CGFloat = 10
               let totalSpacing: CGFloat = spacing * 3 // left + right + между ячейками
               let availableWidth = collectionView.bounds.width - totalSpacing
               let itemWidth = availableWidth / 2
               
               // Высота пропорциональна ширине + место для текста
               let itemHeight = itemWidth * 1.3 // Можно настроить пропорцию
               
               return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 10, left: 10, bottom: 15, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        CGFloat(25)
    }
}

extension MainViewController: MainViewProtocol {
    func finishWith(_ error: any Error) {
        print(error)
    }
    
    func reloadData() {
        self.collectionView.reloadData()
    }
}
