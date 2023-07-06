//
//  Colors.swift
//  BlogEasy
//
//  Created by Moksh Suthar on 22/05/23.
//

import Foundation
import UIKit
import SwiftUI


public extension Color {
    static var systemBackgroudColor : Color {
        return Color(UIColor.init(light: .white, dark: .black))
    }
    
    static var systemTextColor : Color {
        return Color(UIColor.init(light: .black, dark: .white))
    }
    
    init(hex: String, alpha: Double = 1) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
    }
    
    
}

public extension UIColor {

    /// Creates a color object that generates its color data dynamically using the specified colors. For early SDKs creates light color.
    /// - Parameters:
    ///   - light: The color for light mode.
    ///   - dark: The color for dark mode.
    ///   
    convenience init(light: UIColor, dark: UIColor) {
        if #available(iOS 13.0, tvOS 13.0, *) {
            self.init { traitCollection in
                if traitCollection.userInterfaceStyle == .dark {
                    return dark
                }
                return light
            }
        }
        else {
            self.init(cgColor: light.cgColor)
        }
    }
}
