//
//  UIView + Ext.swift
//  CatAtlas
//
//  Created by Alexander Abanshin on 07.10.2025.
//

import UIKit

extension UIView {
    func addView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
    }
}
