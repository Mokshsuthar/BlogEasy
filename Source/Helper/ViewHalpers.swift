//
//  ViewHalpers.swift
//  BlogEasy
//
//  Created by Moksh on 22/05/23.
//

import Foundation
import SwiftUI
struct C_lazyVstack<Content: View> : View {
    @ViewBuilder var builder: Content
    var spacing : CGFloat?
    var alignment : HorizontalAlignment = .center
    
    init(alignment : HorizontalAlignment = .center,spacing : CGFloat? = nil,@ViewBuilder content: @escaping () -> Content) {
        self.alignment = alignment
        self.spacing = spacing
        self.builder = content()
    }
    var body: some View{
        if #available(iOS 14.0, *) {
            LazyVStack(alignment: alignment, spacing: spacing){
                builder
            }
        } else {
            // Fallback on earlier versions
            VStack(alignment: alignment, spacing: spacing){
                builder
            }
        }
    }
}
