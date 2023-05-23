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
    func ImageView(provider :imageProvider,source : imageSource?) -> some View {
        VStack(spacing : 5){
            switch provider {
            case .uiimage(let image):
                if let img = image{
                    Image(uiImage: img)
                        .resizable().aspectRatio(contentMode: .fit)
                        .fullWidth()
                        .cornerRadius(20)
                }
                
                
            case .url(let url):
                Text(url)
            }
            if let source = source {
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
        case .title(let value):
            Text(value)
                .setFont(name: fontName, size: 28 + fontsizeScaler,weight: .heavy)
                .multilineTextAlignment(.leading)
                .fullWidth(alignment: .leading)
        case .headline(let value):
            Text(value)
                .setFont(name: fontName, size: 21 + fontsizeScaler,weight: .bold)
                .multilineTextAlignment(.leading)
                .fullWidth(alignment: .leading)
        case .subheadline(let value):
            Text(value)
                .setFont(name: fontName, size: 18 + fontsizeScaler,weight: .bold)
                .multilineTextAlignment(.leading)
                .fullWidth(alignment: .leading)
        case .caption(let value):
            Text(value)
                .setFont(name: fontName, size: 16 + fontsizeScaler,weight: .light)
                .multilineTextAlignment(.leading)
                .fullWidth(alignment: .leading)
        case .caption2(let value):
            Text(value)
                .setFont(name: fontName, size: 14 + fontsizeScaler,weight: .light)
                .multilineTextAlignment(.leading)
                .fullWidth(alignment: .leading)
        default:
            EmptyView()
        }
    }
}
