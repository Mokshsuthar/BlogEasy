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
}

public extension UIColor {

    /// Creates a color object that generates its color data dynamically using the specified colors. For early SDKs creates light color.
    /// - Parameters:
    ///   - light: The color for light mode.
    ///   - dark: The color for dark mode.
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
