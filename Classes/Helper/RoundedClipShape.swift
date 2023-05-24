//
//  RoundedClipShape.swift
//  BlogEasy
//
//  Created by Moksh on 22/05/23.
//

import Foundation
import SwiftUI

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity // The radius of the rounded corners
    var corners: UIRectCorner = .allCorners // The corners to be rounded

    // Creates a path with rounded corners using the specified radius and corners
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
