//
//  BlogOpenView.swift
//  BlogEasy_Example
//
//  Created by Moksh Suthar on 27/05/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import SwiftUI
import BlogEasy

struct BlogOpenView: View {
    @Environment(\.presentationMode) var presentationMode
    let data : BlogData
    let coverHight : CGFloat?
    
    init(data: BlogData) {
        self.data = data
        self.coverHight = 600
    }
    
    var body: some View {
        BlogView(data: data)
        .showScrollIndictor(false)
        .textLineSpacing(2)
        .coverHeight(coverHight)
        .coverScrollOpacity(0)
        .onBackPress {
            presentationMode.wrappedValue.dismiss()
        }
//        .preferredColorScheme(.light)
    }
}

