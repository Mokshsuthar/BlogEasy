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
    
    /**
     Hides the cover gradient of the view.
    */
    public func hideCoverGradient() -> Self {
        mutating(keyPath: \.showCoverGradient, value: false)
    }
    
    /**
     Hides the cover gradient of the view.
    */
    public func coverHeight(_ value: CGFloat?) -> Self {
        mutating(keyPath: \.coverHeight, value: value ?? self.coverHeight)
    }
    
    ///Registers a callback closure to be executed when the back button is pressed.
    public func onBackPress(_ callback: (() -> Void)?) -> Self {
        mutating(keyPath: \.backButtonAction, value: callback)
    }
    
    ///Registers a callback closure to be executed when the back button is pressed.
    public func coverScrollOpacity(_ value: CGFloat) -> Self {
        mutating(keyPath: \.coverScrollOpacity, value: value)
    }
    
    ///Registers a callback closure to be executed when the back button is pressed.
    public func paddingHorizontal(_ value: CGFloat) -> Self {
        mutating(keyPath: \.paddingHorizontal, value: value)
    }
    
    
//    public func RightTopButton(@ViewBuilder content: () -> View) -> Self{
//        mutating(keyPath: \.backButtonView, value: content)
//    }
}
