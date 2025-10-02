//
//  UIColor + Ext.swift
//  CatAtlas
//
//  Created by Alexander Abanshin on 01.10.2025.
//

import UIKit

extension UIColor {
    
    /// Создает UIColor из HEX строки. Поддерживается #RRGGBB и #AARRGGBB
    ///
    /// - Parameter hex: HEX код цвета в формате строки. Можно с # или без.
    convenience init?(hex: String) {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        // Убираем #
        if hexString.hasPrefix("#") {
            hexString.removeFirst()
        }
        
        var rgba: UInt64 = 0
        
        guard Scanner(string: hexString).scanHexInt64(&rgba) else {
            return nil
        }
        
        switch hexString.count {
        case 6: // RRGGBB
            let r = CGFloat((rgba & 0xFF0000) >> 16) / 255.0
            let g = CGFloat((rgba & 0x00FF00) >> 8) / 255.0
            let b = CGFloat(rgba & 0x0000FF) / 255.0
            self.init(red: r, green: g, blue: b, alpha: 1.0)
            
        case 8: // AARRGGBB
            let a = CGFloat((rgba & 0xFF000000) >> 24) / 255.0
            let r = CGFloat((rgba & 0x00FF0000) >> 16) / 255.0
            let g = CGFloat((rgba & 0x0000FF00) >> 8) / 255.0
            let b = CGFloat(rgba & 0x000000FF) / 255.0
            self.init(red: r, green: g, blue: b, alpha: a)
            
        default:
            return nil
        }
    }
}
