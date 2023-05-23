//
//  DemoView.swift
//  BlogEasy_Example
//
//  Created by Moksh on 22/05/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import SwiftUI
import BlogEasy

struct DemoView: View {
    
    var body: some View {
        ZStack{
            BlogView(coverImage: UIImage(named: "semple"), content: [
                .init(ContentType: .title(value: "ChatGPT integration in Xcode: How to improve your Apps with AI")),
                .init(ContentType: .caption(value: "The latest enfant terrible in the field of Artificial Intelligence is called ChatGPT and comes from OpenAI, a company founded a few years ago that is currently leading the way with products like the aforementioned ChatGPT or DALL-E."))
            ])
            
        }
       
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        DemoView()
    }
}
