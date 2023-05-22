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
            BlogView(title: "Demo", subtitle: "Demo Subtitle",coverImage: UIImage(named: "semple") ,content: [
                .init(ContentType: .headline(value: "पुस्‍तक, नाटक, फ़िल्‍म, चित्र आदि का शीर्षक")),
                .init(ContentType: .subheadline(value: "subheadline"))
            ])
            
        }
       
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        DemoView()
    }
}
