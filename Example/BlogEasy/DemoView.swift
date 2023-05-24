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
                "10 Deadly SwiftUI Mistakes and How You Can Avoid Them".toBlogContent(type: .title,config: .init(size : 30,fontWeight: .heavy)),
                .init(ContentType: .divider),
                .init(ContentType: .bullet(value: "4.0. Bengaluru, Karnataka.")),
                .init(ContentType: .bullet(value: "4.2. Chennai, Tamil Nadu.")),
                .init(ContentType: .bullet(value: "4.3. Delhi, Delhi.")),
                .init(ContentType: .bullet(value: "4.0. Gurgaon, Haryana.")),
                
                .init(ContentType: .bullet(value: "he latest enfant terrible in the field of Artificial Intelligence is called ChatGPT and comes from OpenAI, a company founded a few years ago that is currently leading the way with products like the",config: .init(bulletType: .Text(value: "ELephant :",isContinueLine: false)))),
                
                .init(ContentType: .bullet(value: "he latest enfant terrible in the field of Artificial Intelligence is called ChatGPT and comes from OpenAI, a company founded a few years ago that is currently leading the way with products like the",config: .init(bulletType: .Text(value: "(1) ELephant :",isContinueLine: true)))),
                
                .init(ContentType: .bullet(value: "he latest enfant terrible in the field of Artificial Intelligence is called ChatGPT and comes from OpenAI, a company founded a few years ago that is currently leading the way with products like the",config: .init(bulletType: .Text(value: "1.")))),
                
                    .init(ContentType: .bullet(value: "he latest enfant terrible in the field of Artificial Intelligence is called ChatGPT and comes from OpenAI, a company founded a few years ago that is currently leading the way with products like the",config: .init(bulletType: .Text(value: "2.",color: Color.red)))),
                
                .init(ContentType: .bullet(value: "he latest enfant terrible in the field of Artificial Intelligence is called ChatGPT and comes from OpenAI, a company founded a few years ago that is currently leading the way with products like the",config: .init(bulletType: .Text(value: "3.")))),
                
                "How to pilot through the human roadblocks that clog the path to project execution.".toBlogContent(type: .caption2),
                UIImage(named: "download2")!.toBlogContent(config: .init(cornerRadius: 10,showShadow: false,source: imageSource(text: "dribble.com",url: "https://dribbble.com/mindinventory"))),
                URL(string: "https://i.pinimg.com/564x/7d/c2/43/7dc24333f476a2505aa9a4bd70050997.jpg")!.toBlogContent_Image(),
                UIImage(named: "semplePNG")!.toBlogContent(config: .init(showShadow: true)),
                "Mistake #1: Using @ObservedObject when I meant @StateObject".toBlogContent(type: .headline),
                
                
                
                "The latest enfant terrible in the field of Artificial Intelligence is called ChatGPT and comes from OpenAI, a company founded a few years ago that is currently leading the way with products like the aforementioned ChatGPT or DALL-E.".toBlogContent(type: .caption),
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


//@ViewBuilder
//func TextContent(type : BlogCantentType) -> some View{
//    switch type {
//    case .title(let value,let config):
//        Text(value)
//            .setFont(name: fontName, size: 25 + fontsizeScaler,weight: .heavy,isSmalleCaps: config.smallCaps)
//            .foregroundColor(config.color)
//            .multilineTextAlignment(config.alignment)
//            .lineSpacing(textLineSpacing)
//            .fullWidth(alignment: .leading)
//    case .headline(let value,let config):
//        Text(value)
//            .setFont(name: fontName, size: 21 + fontsizeScaler,weight: .bold,isSmalleCaps: config.smallCaps)
//            .foregroundColor(config.color)
//            .multilineTextAlignment(config.alignment)
//            .lineSpacing(textLineSpacing)
//            .fullWidth(alignment: .leading)
//    case .subheadline(let value,let config):
//        Text(value)
//            .setFont(name: fontName, size: 18 + fontsizeScaler,weight: .bold,isSmalleCaps: config.smallCaps)
//            .foregroundColor(config.color)
//            .multilineTextAlignment(config.alignment)
//            .lineSpacing(textLineSpacing)
//            .fullWidth(alignment: .leading)
//    case .caption(let value,let config):
//        Text(value)
//            .setFont(name: fontName, size: 16 + fontsizeScaler,weight: .light,isSmalleCaps: config.smallCaps)
//            .foregroundColor(config.color)
//            .multilineTextAlignment(config.alignment)
//            .lineSpacing(textLineSpacing)
//            .fullWidth(alignment: .leading)
//    case .caption2(let value,let config):
//        Text(value)
//            .setFont(name: fontName, size: 14 + fontsizeScaler,weight: .light,isSmalleCaps: config.smallCaps)
//            .foregroundColor(config.color)
//            .multilineTextAlignment(config.alignment)
//            .lineSpacing(textLineSpacing)
//            .fullWidth(alignment: .leading)
//    default:
//        EmptyView()
//    }
//}
