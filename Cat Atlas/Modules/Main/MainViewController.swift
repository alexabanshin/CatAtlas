//
//  ViewController.swift
//  Cat Atlas_UIKit
//
//  Created by Alexander Abanshin on 30.09.2025.
//

import UIKit

class MainViewController: BreedsCollectionViewController {
    private let presenter: MainViewPresenterProtocol
    
    init(presenter: MainViewPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData() // обновляем состояние кнопок закладок
    }


    private func configureView() {
        customNavBar.titleLabel.text = "Cat Atlas"
        customNavBar.imageView.image = UIImage(named: "cat")
    }
    
}

extension MainViewController: MainViewProtocol {
    func reloadData() {
           updateBreeds(presenter.breeds)
       }
       
       func finishWith(_ error: Error) {
           print("Ошибка загрузки: \(error.localizedDescription)")
       }
}
