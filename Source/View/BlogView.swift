//
//  BlogView.swift
//  BlogEasy
//
//  Created by Moksh on 22/05/23.
//

import SwiftUI

public struct BlogView: View {
    //Blogs backgroud color
    var backgroundColor : Color = .systemBackgroudColor
    
    var fontsizeScaler : CGFloat = 10
    
    var fontName : String?
    
    
    
    
    var title : String
    var subtitle : String
    var coverImage : UIImage?
    var content : [BlogCantent]
    
    public init(title: String, subtitle: String,coverImage : UIImage?,content: [BlogCantent]) {
        self.title = title
        self.subtitle = subtitle
        self.coverImage = coverImage
        self.content = content
    }
    
    public var body: some View {
        ZStack{
            
            VStack{
                if let img = self.coverImage{
                    Image(uiImage: img)
                        .resizable().aspectRatio(contentMode: .fill)
                        .fullWidth(height: UIDevice.current.isPad ? 300 : BlogView.screenWidth)
                        .overlay(VStack{
                           LinearGradient(colors: [backgroundColor,backgroundColor.opacity(0)], startPoint: .top, endPoint: .bottom)
                                .fullWidth(height: BlogView.notchHeight)
                            
                            Spacer()
                            
                            VStack{
                               Text(title)
                                    .setFont(name: fontName, size: 30)
                            }
                            .fullWidth(height: 80)
                            .background(LinearGradient(colors: [backgroundColor.opacity(0),backgroundColor], startPoint: .top, endPoint: .bottom))
                            
                           
                                
                        })
                        .clipped()
                }
                
                
                Spacer()
            }
            
            
            ScrollView(.vertical) {
            
                C_lazyVstack {
                    
                    Spacer()
                        .fullWidth(height: UIDevice.current.isPad ? 300 : BlogView.screenWidth)
                    
                    ForEach(content) { content in
                        switch content.ContentType {
                        case .title(let value) :
                            Text(value)
                        case .headline(let value) :
                            Text(value)
                        case .subheadline(let value) :
                            Text(value)
                        case .caption(let value):
                            Text(value)
                        case .caption2(let value):
                            Text(value)
                        case .image(let img):
                            Image(uiImage: img)
                        case .transparentImage(let img):
                            Image(uiImage: img)
                        case .bullet(let bulletImage,let value):
                            Text(value)
                        case .TextBullet(let BulletString, let value):
                            Text(value)
                        case .divider:
                            Divider()
                        case .link(let text,let url):
                            Text(url)
                        case .EmptyView:
                            EmptyView()
                        case .spacer(let height):
                            Spacer()
                                .fullWidth(height: height)
                        default :
                            Text("ffffff")
                        
                        }
                        
                    }
                }
            }
            
        }
        .ignoreSafeArea_C()
    }
}
