//
//  Helper.swift
//  BlogEasy
//
//  Created by Moksh on 22/05/23.
//

import Foundation
import SwiftUI

extension View
{
   
    // Get the height of the device screen
    static var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }

    // Get the width of the device screen
    static var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }

    // Get the height of the device's notch (if applicable)
    static var notchHeight: CGFloat {
        return UIDevice.current.notchSize
    }

    // Check if the device height is less than the small screen height threshold
    static var isSmallScreen: Bool {
        let smallScreenHeightThreshold: CGFloat = 815
        return UIScreen.main.bounds.height < smallScreenHeightThreshold
    }

    
    // Hides the home indicator on devices running iOS 16.0 or later
    func hideHomeIndicator() -> some View {
        if #available(iOS 16.0, *) {
            // Use the `persistentSystemOverlays` modifier with `.hidden` to hide the home indicator
            return self.persistentSystemOverlays(.hidden)
        } else {
            // Return the original view as is for devices running earlier versions of iOS
            return self
        }
    }
    
    // Ignores the safe area insets of the device on iOS 14 and above
    func ignoreSafeArea_C() -> some View {
        if #available(iOS 14.0, *) {
            return self.ignoresSafeArea()
        } else {
            return self
        }
    }
    
    
    func countinueRoundBackGround(CornerRadiue : CGFloat,color : Color) -> some View{
        return self.background(RoundedRectangle(cornerRadius: CornerRadiue,style: .continuous).fill(color))
    }
    
    func maskcountinueRound(CornerRadiue : CGFloat) -> some View {
        return self.mask(RoundedRectangle(cornerRadius: CornerRadiue,style: .continuous).fill(Color.white))
    }
    
    
    // Adjusts the view's frame to account for the bottom safe area
    func bottomSafeArea(width: CGFloat = 0, plus: CGFloat = 0, ifZero: CGFloat = 0) -> some View {
        if UIDevice.current.bottomSafeArea == 0 {
            // If the bottom safe area size is 0, return the view with the adjusted height
            return self.frame(width: width, height: ifZero + plus, alignment: .center)
        } else {
            // If the bottom safe area size is not 0, return the view with the adjusted height
            return self.frame(width: width, height: UIDevice.current.bottomSafeArea + plus, alignment: .center)
        }
    }
    
    // Adjusts the view's frame to account for the notch size on the device
    func adjustForNotch(width: CGFloat = 0, plus: CGFloat = 0) -> some View {
        // Get the notch size from the current device
        let notchSize = UIDevice.current.notchSize
        
        // Return the view with the adjusted height to accommodate the notch
        return self.frame(width: width, height: notchSize + plus, alignment: .center)
    }
   
   
    // Returns a view that occupies the full available frame with the specified alignment
    func fullFrame(alignment: Alignment = .center) -> some View {
        return self.frame(
            minWidth: 0,
            idealWidth: 100,
            maxWidth: .infinity,
            minHeight: 0,
            idealHeight: 100,
            maxHeight: .infinity,
            alignment: alignment
        )
    }
    
    
    // Returns a square view with the specified size and centered alignment
    func squareFrame(size: CGFloat,alignment: Alignment = .center) -> some View {
        return self.frame(width: size, height: size, alignment: alignment)
    }
    
    // Returns a view that occupies the full available width with the specified alignment
    func fullWidth(height : CGFloat = 0,alignment: Alignment = .center) -> some View {
        return self.frame(
            minWidth: 0,
            idealWidth: 100,
            maxWidth: .infinity,
            minHeight: height,
            idealHeight: height,
            maxHeight: height,
            alignment: alignment
        )
    }
    
    // Returns a view that occupies the full available height with the specified width and alignment
    func fullHeight(width: CGFloat = 0, alignment: Alignment = .center) -> some View {
        return self.frame(
            minWidth: width,
            idealWidth: width,
            maxWidth: width,
            minHeight: 0,
            idealHeight: 100,
            maxHeight: .infinity,
            alignment: alignment
        )
    }

    
    // Returns the corner radius of the device's display, capped at the specified minimum value
    func deviceCornerRadius(minimum: CGFloat = 0) -> CGFloat {
        // Retrieve the display corner radius from the main screen
        return UIScreen.main.displayCorner(minimum: minimum)
    }
    
    
    // Clips the view to a rounded corner shape with the specified radius and corners
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
    
    
}




extension UIDevice {
    /// Returns `true` if the device has a notch
    var hasNotch: Bool {
        guard #available(iOS 11.0, *), let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else { return false }
        if UIDevice.current.orientation.isPortrait {
            return window.safeAreaInsets.top >= 44
        } else {
            return window.safeAreaInsets.left > 0 || window.safeAreaInsets.right > 0
        }
    }
    
    /// Returns the height of the notch area, or 0 if not applicable
    var notchSize: CGFloat {
        guard #available(iOS 11.0, *), let window =  UIApplication.shared.windows.filter({$0.isKeyWindow}).first   else { return 0 }
        return window.safeAreaInsets.top
    }
    
    /// Returns the height of the bottom safe area, or 0 if not applicable
    var bottomSafeArea: CGFloat {
        guard #available(iOS 11.0, *), let window =  UIApplication.shared.windows.filter({$0.isKeyWindow}).first  else { return 0 }
        return window.safeAreaInsets.bottom
    }
    
    /// Returns `true` if the device is an iPad
    var isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
}



extension UIScreen {
    // Key used to retrieve the display corner radius value
    private static let cornerRadiusKey: String = {
        let components = ["Radius", "Corner", "display", "_"]
        return components.reversed().joined()
    }()
    
    // Returns the display corner radius, or a default value of 10 if unavailable
    public var displayCornerRadius: CGFloat {
        guard let cornerRadius = self.value(forKey: Self.cornerRadiusKey) as? CGFloat else {
            return 10
        }
        // Ensure the corner radius is not less than 10
        return max(cornerRadius, 10)
    }
    
    // Returns the display corner radius, capped at the specified minimum value
    func displayCorner(minimum: CGFloat) -> CGFloat {
        if self.displayCornerRadius < minimum {
            return minimum
        } else {
            return self.displayCornerRadius
        }
    }
}
