//
//  ViewController.swift
//  Cat Atlas_UIKit
//
//  Created by Alexander Abanshin on 30.09.2025.
//

import UIKit

final class MainViewController: UIViewController {
    private let presenter: MainViewPresenterProtocol
    private let customNavBar = CustomNavBar()
    private lazy var collectionView = makeCollectionView()
    
    init(presenter: MainViewPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        setupCustomNavBar()
        setConstraints()
    }
    
    

}

private extension MainViewController {
    func setupView() {
        view.addSubview(collectionView)
        view.backgroundColor = UIColor(hex: "f2e5f1")
    }
    
    func makeCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor(hex: "f2e5f1")
        collectionView.register(MainCell.self, forCellWithReuseIdentifier: "cell")
       
        return collectionView
    }
    
    func setupCustomNavBar() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        view.addSubview(customNavBar)
        customNavBar.backgroundColor = .clear
        customNavBar.titleLabel.text = "Cat Atlas"
        customNavBar.imageView.image = UIImage(named: "cat")
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            customNavBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            customNavBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customNavBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customNavBar.heightAnchor.constraint(equalToConstant: 100),
            
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
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
        let spacing: CGFloat = 13
        let totalSpacing: CGFloat = spacing * 3
        let availableWidth = collectionView.bounds.width - totalSpacing
        let itemWidth = availableWidth / 2
        
        let itemHeight = itemWidth * 1.15
        
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 70, left: 10, bottom: 15, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        CGFloat(25)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        CGFloat(10)
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

// MARK: - Scroll
extension MainViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        customNavBar.updateAlpha(with: offsetY)
    }
}
