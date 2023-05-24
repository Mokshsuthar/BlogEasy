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
                        .shadow(color: Color.black.opacity(config.showShadow ? 0.4 : 0), radius: 8, x: 0, y: 0)
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
    func TextContent(value : String,config : TextConfig) -> some View{
       
        Text(value)
            .underline(config.UnderLine)
            .setFont(name: fontName, size: config.size + fontsizeScaler,weight: config.fontWeight,isSmallCaps: config.smallCaps)
            .foregroundColor(config.color)
            .multilineTextAlignment(config.alignment)
            .lineSpacing(textLineSpacing)
            .fullWidth(alignment: .leading)
            .opacity(config.opacity)
        
    }
    
    @ViewBuilder
    func BulletPoint(value : String,config : BulletPointConfig) -> some View {
        HStack(alignment: .top, spacing : 5) {
            switch config.bulletType{
            case .Text(let BulletTextvalue ,let color,let isContinue):
                if isContinue{
                    Group{
                        Text("\(BulletTextvalue) ")
                            .fontWeight(.bold)
                            .foregroundColor(color ?? textColor)
                        +
                        
                        Text(value)
                            
                            .foregroundColor(config.textColor ?? textColor)
                           
                    }
                    .setFont(name: fontName, size: config.fontSize, weight: config.fontWeight)
                    .fullWidth(alignment: .leading)
                }else {
                    Text(BulletTextvalue)
                        .setFont(name: fontName, size: config.fontSize, weight: .bold)
                        .foregroundColor(color ?? textColor)
                    
                    Text(value)
                        .setFont(name: fontName, size: config.fontSize, weight: config.fontWeight)
                        .foregroundColor(config.textColor ?? textColor)
                        .fullWidth(alignment: .leading)
                }
                
                
            case .systemImage(let name,let color):
                systemIcon(name)
                    .foregroundColor(color ?? accentColor)
                    .padding(3)
                    .squareFrame(size: config.fontSize)
                    .padding(.top,2)
                
                Text(value)
                    .setFont(name: fontName, size: config.fontSize, weight: config.fontWeight)
                    .foregroundColor(config.textColor ?? textColor)
                    .fullWidth(alignment: .leading)
            }
            
            
        }
    }
}
