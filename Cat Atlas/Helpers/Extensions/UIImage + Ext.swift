//
//  UIImage + Ext.swift
//  CatAtlas
//
//  Created by Alexander Abanshin on 01.10.2025.
//

import UIKit

extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        self.draw(in: CGRect(origin: .zero, size: size))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage ?? self
    }
}

