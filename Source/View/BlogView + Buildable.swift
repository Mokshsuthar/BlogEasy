//
//  BlogView + Builder.swift
//  BlogEasy
//
//  Created by Moksh on 23/05/23.
//

import Foundation
import SwiftUI
extension BlogView : Buildable {
    
    /// Sets the visibility of the scroll indicator for the current view.
    /// - Parameter value: A Boolean value indicating whether to show or hide the scroll indicator.
    /// - Returns: The modified instance of the type on which the function is called.
    public func showScrollIndictor(_ value: Bool) -> Self {
        mutating(keyPath: \.showScrollIndicator, value: value)
    }
    
    /**
     Sets the line spacing for the text in the current view.

     - Parameter value: The desired line spacing value, specified as a `CGFloat`.
     - Returns: The modified instance of the type on which the function is called.
     */
    public func textLineSpacing(_ value: CGFloat) -> Self {
        mutating(keyPath: \.textLineSpacing, value: value)
    }
    
//    public func RightTopButton(_ value : some View) -> Self{
//        mutating(keyPath: \.backButtonView, value: value)
//    }
}
