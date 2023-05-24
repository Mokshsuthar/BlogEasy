//
//  BlogView + viewProvider.swift
//  BlogEasy
//
//  Created by Moksh on 23/05/23.
//

import Foundation
import SwiftUI
import UIKit

extension BlogView{
    
    @ViewBuilder
    func ImageView(provider : imageProvider,config : ImageConfig) -> some View {
        VStack(spacing : 5){
            switch provider {
            case .uiimage(let image):
                if let img = image{
                    Image(uiImage: img)
                        .resizable().aspectRatio(contentMode: config.aspectMode)
                        .fullWidth()
                        .background(config.backgroundColor)
                        .cornerRadius(config.cornerRadius)
                        .shadow(color: Color.black.opacity(config.showShadow ? 0.2 : 0), radius: 4, x: 0, y: 0)
                }
                
                
            case .url(let url):
                Text(url)
            }
            if let source = config.source {
                HStack(spacing : 3){
                    Text("source :")
                       
                    if let urlText = source.url,
                       let url = URL(string: urlText){
                        Text("\(source.text)")
                            .underline()
                            .onTapGesture {
                                if UIApplication.shared.canOpenURL(url) {
                                       UIApplication.shared.open(url)
                                }
                            }
                    } else {
                        Text("\(source.text)")
                    }
                }
                .fullWidth(alignment: .leading)
                .font(.caption)
                .opacity(0.5)
                
            }
           
        }
    }
    
  
    
    @ViewBuilder
    func TextContent(type : BlogCantentType) -> some View{
        
        switch type {
        case .title(let value,let config):
            Text(value)
                .underline(config.UnderLine)
                .setFont(name: fontName, size: 25 + fontsizeScaler,weight: .heavy,isSmallCaps: config.smallCaps)
                .foregroundColor(config.color)
//                .textUnderLine(isActive: config.UnderLine)
                .multilineTextAlignment(config.alignment)
                .lineSpacing(textLineSpacing)
                .fullWidth(alignment: .leading)
                .opacity(config.opacity)
        case .headline(let value,let config):
            Text(value)
                .underline(config.UnderLine)
                .setFont(name: fontName, size: 21 + fontsizeScaler,weight: .bold,isSmallCaps: config.smallCaps)
                .foregroundColor(config.color)
                .multilineTextAlignment(config.alignment)
                .lineSpacing(textLineSpacing)
                .fullWidth(alignment: .leading)
                .opacity(config.opacity)
        case .subheadline(let value,let config):
            Text(value)
                .underline(config.UnderLine)
                .setFont(name: fontName, size: 18 + fontsizeScaler,weight: .bold,isSmallCaps: config.smallCaps)
                .foregroundColor(config.color)
                .multilineTextAlignment(config.alignment)
                .lineSpacing(textLineSpacing)
                .fullWidth(alignment: .leading)
                .opacity(config.opacity)
        case .caption(let value,let config):
            Text(value)
                .underline(config.UnderLine)
                .setFont(name: fontName, size: 16 + fontsizeScaler,weight: .light,isSmallCaps: config.smallCaps)
                .foregroundColor(config.color)
                .multilineTextAlignment(config.alignment)
                .lineSpacing(textLineSpacing)
                .fullWidth(alignment: .leading)
                .opacity(config.opacity)
        case .caption2(let value,let config):
            Text(value)
                .underline(config.UnderLine)
                .setFont(name: fontName, size: 14 + fontsizeScaler,weight: .light,isSmallCaps: config.smallCaps)
                .foregroundColor(config.color)
                .multilineTextAlignment(config.alignment)
                .lineSpacing(textLineSpacing)
                .fullWidth(alignment: .leading)
                .opacity(config.opacity)
        default:
            EmptyView()
        }
    }
}
