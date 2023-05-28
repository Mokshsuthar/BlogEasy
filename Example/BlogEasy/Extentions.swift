//
//  Extentions.swift
//  BlogEasy_Example
//
//  Created by Moksh Suthar on 27/05/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation
import SwiftUI
public extension Color {
    static var systemBackgroudColor : Color {
        return Color(UIColor.init(light: .white, dark: .black))
    }
    
    static var systemTextColor : Color {
        return Color(UIColor.init(light: .black, dark: .white))
    }
}
