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
            BlogView(coverImage: .url(url: "https://i.pinimg.com/736x/7c/bd/0a/7cbd0a418c3cefc6ba1d6d5b7170b535.jpg"), content: [
                
                "Blog".toBlogContent(type: .subheadline,config: .init(size: 15, fontWeight: .bold, color: Color.accentColor, UnderLine: false, smallCaps: true, opacity: 1, alignment: .leading)),
                
                "Top 10 Car Stories Which Perfectly Encapsulate 2020".toBlogContent(type: .headline,config: .init(size : 24,fontWeight: .heavy)),
                
                    .init(ContentType: .divider),
                
                "What a year…".toBlogContent(type: .subheadline),
                "At the start of this year, it seemed like pretty much any other. The economy was strong, Arizona hosted some amazing car auctions, a whole slate of modern collectible car releases was scheduled for this year, and in general things were going great. Then there were murmurs of a new coronavirus spreading through China, but nobody could possibly know how that would affect just about everything in the automotive industry as well as the world. We think it’s fair to say many people are relieved 2020 is almost over, even though there’s no guarantee 2021 won’t be just as bad or even worse.".toBlogContent(type: .caption),
                
                "Now that the year is about over, it’s time to look at the 10 car-related stories which really encapsulate what surviving 2020 has been like.".toBlogContent(type: .caption),
                
                "1. COVID Corvettes".toBlogContent(type: .headline),
                
                URL(string: "https://i.pinimg.com/564x/19/27/cc/1927cce399e3b9e2db15d3483cd72518.jpg")!.toBlogContent_Image(config: .init(source: .init(text: "Chevrolet"))),
                
                "The market launch of the C8 Corvettes didn’t go smoothly, thanks at first to a union strike in Bowling Green, then the shutdown of production as fear of millions of Americans dead from COVID-19 sent a shockwave through the country. The factory opened back up in May, but production was pretty slow-going at first, thanks to extra precautions taken to avoid spreading the virus among workers. While since then Bowling Green is churning out more C8 Corvettes, there have been reports of questionable quality control. This string of problems chronicles the way 2020 has gone.".toBlogContent(type: .caption),
                
                "2. Dukes Of Hazzard Jump In California".toBlogContent(type: .headline),
                
                URL(string: "https://i.pinimg.com/564x/2e/f3/9c/2ef39c296edf3378296731e642909324.jpg")!.toBlogContent_Image(config: .init(source: .init(text: "YouTube"))),
               
                "It kind of seems like fate fell asleep at the wheel this year or at least was texting, kind of like what might have happened with a driver in Modesto, California recently. That person inadvertently veered off the highway and did a Dukes of Hazzard-style jump, with the whole thing caught on camera.".toBlogContent(type: .caption),
                
                
                "2. Dukes Of Hazzard Jump In California".toBlogContent(type: .headline),
                
                URL(string: "https://i.pinimg.com/564x/2e/f3/9c/2ef39c296edf3378296731e642909324.jpg")!.toBlogContent_Image(config: .init(source: .init(text: "YouTube"))),
               
                "It kind of seems like fate fell asleep at the wheel this year or at least was texting, kind of like what might have happened with a driver in Modesto, California recently. That person inadvertently veered off the highway and did a Dukes of Hazzard-style jump, with the whole thing caught on camera.".toBlogContent(type: .caption),
                
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
