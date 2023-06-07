//
//  Dict + Extention.swift
//  BlogEasy
//
//  Created by Moksh Suthar on 29/05/23.
//

import Foundation
import SwiftUI
import UIKit

extension Font.Weight {
    func rawValue() -> String {
        switch self {
        case .black :
            return "black"
        case .bold :
            return "bold"
        case .heavy :
            return "heavy"
        case .light :
            return "light"
        case .medium :
            return "medium"
        case .regular :
            return "regular"
        case .semibold :
            return "semibold"
        case .thin :
            return "thin"
        case .ultraLight :
            return "ultraLight"
        default:
            return "regular"
        }
    }
}


extension UIColor{
    
    func rawValue() -> String{
        switch self {
        case .red:
            return "Red"
        case .orange:
            return "Orange"
        case .yellow:
            return "Yellow"
        case .green:
            return "Green"
        case .blue:
            return "Blue"
        case .purple:
            return "Purple"
        case .brown:
            return "Brown"
        case .cyan:
            return "Cyan"
        case .magenta:
            return "Magenta"
        case .gray:
            return "Gray"
        case .white:
            return "White"
        case .black:
            return "Black"
        case .clear:
            return "Clear"
        default:
            if let colorCode = self.toHexCode() {
                return colorCode
            } else {
                return "systemBackgroudColor"
            }
        }
    }
    

}

extension Color {
    func rawValue() -> String {
        switch self {
        case .systemBackgroudColor:
            return "systemBackgroudColor"
        case .systemTextColor:
            return "systemTextColor"
        case .accentColor:
            return "accentColor"
        case .black:
            return "black"
        case .white:
            return "white"
        case .blue:
            return "blue"
        case .clear:
            return "clear"
        case .gray:
            return "gray"
        case .green:
            return "green"
        case .orange:
            return "orange"
        case .pink:
            return "pink"
        case .primary:
            return "primary"
        case .purple:
            return "purple"
        case .red:
            return "red"
        case .secondary:
            return "secondary"
        case .yellow:
            return "yellow"
        default:
            let uicolor = UIColor(self)
            if let colorCode = uicolor.toHexCode() {
                return colorCode
            } else {
                return "systemBackgroudColor"
            }
           
        }
    }
    
    
}

extension TextAlignment{
    func rawValue() -> String {
        switch self {
        case .leading:
            return "leading"
        case .center:
            return "center"
        case .trailing:
            return "trailing"
        }
    }
}
