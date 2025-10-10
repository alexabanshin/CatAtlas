//
//  UIFont + Ext.swift
//  CatAtlas
//
//  Created by Alexander Abanshin on 07.10.2025.
//

import UIKit

enum CustomFont: String {
    case comicNeueRegular  = "ComicNeue-Regular"
    case comicNeueLightItalic  = "ComicNeue-LightItalic"
    case comicNeueLight  = "ComicNeue-Light"
    case comicNeueItalic  = "ComicNeue-Italic"
    case comicNeueBoldItalic  = "ComicNeue-BoldItalic"
    case comicNeueBold  = "ComicNeue-Bold"
    
}

extension UIFont {
    static func custom(_ font: CustomFont, size: CGFloat) -> UIFont {
        UIFont(name: font.rawValue, size: size) ?? .systemFont(ofSize: size)
    }
}
