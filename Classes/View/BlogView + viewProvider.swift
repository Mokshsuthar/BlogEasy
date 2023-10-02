//
//  BlogView + viewProvider.swift
//  BlogEasy
//
//  Created by Moksh on 23/05/23.
//

import Foundation
import SwiftUI
import UIKit
import Kingfisher

extension BlogView{
    
    @ViewBuilder
    func CoverImage() -> some View {
        if let coverImageProvider = self.blogData.coverImage{
           
            ZStack{
                
                switch coverImageProvider {
                case .uiimage(let name):
                    if let img = UIImage(named: name){
                        Image(uiImage: img)
                            .resizable().aspectRatio(contentMode: .fill)
                            .fullWidth()
                            .clipped()
                           
                    }
                   
                case .url(let url):
//                    if let url = URL(string: url){
//
//                    }
                    KFImage.url( URL(string: url)!)
                        .resizable()
//                                    .placeholder(Rectangle().fill(Color.green))
                        .loadDiskFileSynchronously()
                    //                    .cancelOnDisappear(true)
                        .cacheMemoryOnly()
                        .fade(duration: 0.25)
                        .aspectRatio(contentMode: .fill)
                        .fullWidth()
                        .clipped()
                        
                       
                }
            }
            .fullWidth(height: coverHeight + strachValue)
            .blur(radius: 10 * ScrollPer)
            .opacity(coverOpacity)
            .overlay(VStack{
                Spacer()
                if self.showCoverGradient {
                    LinearGradient(colors: [blogData.backgroudColor?.getColor().opacity(0) ?? backgroundColor.opacity(0),blogData.backgroudColor?.getColor() ?? backgroundColor], startPoint: .top, endPoint: .bottom)
                    .fullWidth(height: 100)
                }
                
            })
            .clipped()
            .scaleEffect(1 + (0.5 * ScrollPer) )
            
            
        }
    }
    
    @ViewBuilder
    func ImageView(provider : imageProvider,config : ImageConfig) -> some View {
        VStack(spacing : 5){
            switch provider {
            case .uiimage(let name):
                if let img = UIImage(named: name){
                    Image(uiImage: img)
                        .resizable().aspectRatio(contentMode: config.aspectMode)
                        .fullWidth()
                        .background(config.backgroundColor.getColor())
                        .cornerRadius(config.cornerRadius)
                        .shadow(color: Color.black.opacity(config.showShadow ? 0.4 : 0), radius: 8, x: 0, y: 0)
                        .padding(.horizontal,config.isHorizontalPadding ? paddingHorizontal : 0)
                }
                
                
            case .url(let url):
                KFImage.url(URL(string: url)!)
                    .resizable()
//                    .placeholder(UI)
                    .loadDiskFileSynchronously()
                    .cancelOnDisappear(true)
                    .cacheMemoryOnly()
                    .fade(duration: 0.25)
                    .aspectRatio(contentMode: .fit)
                    .fullWidth()
                    .background(config.backgroundColor.getColor())
                    .cornerRadius(config.cornerRadius)
                    .shadow(color: Color.black.opacity(config.showShadow ? 0.4 : 0), radius: 8, x: 0, y: 0)
                    .padding(.horizontal,config.isHorizontalPadding ? paddingHorizontal : 0)
            }
            //source of image if Added
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
                .padding(.horizontal,paddingHorizontal)
                
            }
           
        }
    }
    
  
    
    @ViewBuilder
    func TextContent(type : BlogCantentType) -> some View{
        switch type {
        case .title(let value, let config):
            Text(value)
                .underline(config.UnderLine)
                .setFont(name: fontName, size: config.size + fontsizeScaler,weight: config.fontWeight,isSmallCaps: config.smallCaps)
                .forgroundColor(config.color, defaultColor: Color.systemTextColor)
                .multilineTextAlignment(config.alignment)
                .lineSpacing(textLineSpacing)
                .fullWidth(alignment: .leading)
                .opacity(config.opacity)
                .padding(.horizontal,paddingHorizontal)
        case .headline(let value, let config):
            Text(value)
                .underline(config.UnderLine)
                .setFont(name: fontName, size: config.size + fontsizeScaler,weight: config.fontWeight,isSmallCaps: config.smallCaps)
                .forgroundColor(config.color, defaultColor: Color.systemTextColor)
                .multilineTextAlignment(config.alignment)
                .lineSpacing(textLineSpacing)
                .fullWidth(alignment: .leading)
                .opacity(config.opacity)
                .padding(.horizontal,paddingHorizontal)
        case .subheadline(let value, let config):
            Text(value)
                .underline(config.UnderLine)
                .setFont(name: fontName, size: config.size + fontsizeScaler,weight: config.fontWeight,isSmallCaps: config.smallCaps)
                .forgroundColor(config.color, defaultColor: Color.systemTextColor)
                .multilineTextAlignment(config.alignment)
                .lineSpacing(textLineSpacing)
                .fullWidth(alignment: .leading)
                .opacity(config.opacity)
                .padding(.horizontal,paddingHorizontal)
        case .caption(let value, let config):
            Text(value)
                .underline(config.UnderLine)
                .setFont(name: fontName, size: config.size + fontsizeScaler,weight: config.fontWeight,isSmallCaps: config.smallCaps)
                .forgroundColor(config.color, defaultColor: Color.systemTextColor)
                .multilineTextAlignment(config.alignment)
                .lineSpacing(textLineSpacing)
                .fullWidth(alignment: .leading)
                .opacity(config.opacity)
                .padding(.horizontal,paddingHorizontal)
        case .caption2(let value, let config):
            Text(value)
                .underline(config.UnderLine)
                .setFont(name: fontName, size: config.size + fontsizeScaler,weight: config.fontWeight,isSmallCaps: config.smallCaps)
                .forgroundColor(config.color, defaultColor: Color.systemTextColor)
                .multilineTextAlignment(config.alignment)
                .lineSpacing(textLineSpacing)
                .fullWidth(alignment: .leading)
                .opacity(config.opacity)
                .padding(.horizontal,paddingHorizontal)
        case .customText(let value, let config):
            Text(value)
                .underline(config.UnderLine)
                .setFont(name: fontName, size: config.size + fontsizeScaler,weight: config.fontWeight,isSmallCaps: config.smallCaps)
                .forgroundColor(config.color, defaultColor: Color.systemTextColor)
                .multilineTextAlignment(config.alignment)
                .lineSpacing(textLineSpacing)
                .fullWidth(alignment: .leading)
                .opacity(config.opacity)
                .padding(.horizontal,paddingHorizontal)
            
        default :
            Text("")
                .opacity(0)
       
        }
        
        
    }
    
    @ViewBuilder
    func linkView(text : String,url : String) -> some View{
        Group{
            Text("\(text) ")
                .fontWeight(.bold)
                .foregroundColor(textColor)
            +
            
            Text(url)
                .foregroundColor(Color.blue)
               
        }
        .setFont(name: fontName, size: 14 + fontsizeScaler,weight: .light)
        .fullWidth(alignment: .leading)
        .padding(.horizontal,paddingHorizontal)
        .onTapGesture {
            if let url = URL(string: url){
                UIApplication.shared.open(url)
            }
        }
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
                            .foregroundColor(color?.getColor() ?? textColor)
                        +
                        
                        Text(value)
                            .foregroundColor(config.textColor?.getColor() ?? textColor)
                           
                    }
                    .setFont(name: fontName, size: config.fontSize, weight: config.fontWeight)
                    .fullWidth(alignment: .leading)
                }else {
                    Text(BulletTextvalue)
                        .setFont(name: fontName, size: config.fontSize, weight: .bold)
                        .foregroundColor(color?.getColor() ?? textColor)
                    
                    Text(value)
                        .setFont(name: fontName, size: config.fontSize, weight: config.fontWeight)
                        .foregroundColor(config.textColor?.getColor() ?? textColor)
                        .fullWidth(alignment: .leading)
                }
                
                
            case .systemImage(let name,let color):
                systemIcon(name)
                    .foregroundColor(color?.getColor() ?? accentColor)
                    .padding(3)
                    .squareFrame(size: config.fontSize)
                    .padding(.top,2)
                
                Text(value)
                    .setFont(name: fontName, size: config.fontSize, weight: config.fontWeight)
                    .foregroundColor(config.textColor?.getColor() ?? textColor)
                    .fullWidth(alignment: .leading)
            }
            
            
        }
        .padding(.horizontal,paddingHorizontal)
    }
}
