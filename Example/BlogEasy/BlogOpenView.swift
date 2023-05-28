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
    
    var body: some View {
        BlogView(data: data)
        .showScrollIndictor(false)
        .textLineSpacing(2)
        .onBackPress {
            presentationMode.wrappedValue.dismiss()
        }
    }
}

