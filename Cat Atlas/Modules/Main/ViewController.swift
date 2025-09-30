//
//  ViewController.swift
//  Cat Atlas_UIKit
//
//  Created by Alexander Abanshin on 30.09.2025.
//

import UIKit

class ViewController: UIViewController {
    let network = NetworkService()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        network.fetchBreeds { result in
            switch result {
            case .success(let breeds):
                print(breeds[0].name)
            case .failure(let error):
                print(error)
            }
        }
    }
    


}

