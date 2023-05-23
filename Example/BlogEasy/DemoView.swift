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
                "10 Deadly SwiftUI Mistakes and How You Can Avoid Them".toBlogContent(type: .title),
                "How to pilot through the human roadblocks that clog the path to project execution.".toBlogContent(type: .caption2),
                
                    .init(ContentType: .divider),
                
                UIImage(named: "download2")!.toBlogContent(source: imageSource(text: "dribble.com",url: "https://dribbble.com/mindinventory")),
                URL(string: "https://i.pinimg.com/564x/7d/c2/43/7dc24333f476a2505aa9a4bd70050997.jpg")!.toBlogContent_Image(),
                
                "Mistake #1: Using @ObservedObject when I meant @StateObject".toBlogContent(type: .headline),
                
                "The latest enfant terrible in the field of Artificial Intelligence is called ChatGPT and comes from OpenAI, a company founded a few years ago that is currently leading the way with products like the aforementioned ChatGPT or DALL-E.".toBlogContent(type: .caption),
                
                "But these products are not exempt from controversy due to the debate that their use has caused within software development and the possible disappearance of developers at the hands of ChatGPT or one of its older brothers that is yet to come.".toBlogContent(type: .caption),
                "But these products are not exempt from controversy due to the debate that their use has caused within software development and the possible disappearance of developers at the hands of ChatGPT or one of its older brothers that is yet to come.".toBlogContent(type: .caption),
                "But these products are not exempt from controversy due to the debate that their use has caused within software development and the possible disappearance of developers at the hands of ChatGPT or one of its older brothers that is yet to come.".toBlogContent(type: .caption),
                
                .init(ContentType: .link(text: "Ref :", url: "https://dribbble.com/mindinventory"))
                
            ])
            .showScrollIndictor(false)
            .textLineSpacing(2)
            
        }
       
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        DemoView()
    }
}
