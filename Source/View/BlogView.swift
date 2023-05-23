//
//  BlogView.swift
//  BlogEasy
//
//  Created by Moksh on 22/05/23.
//

import SwiftUI


public struct BlogView: View {
    //backgroud color
    var backgroundColor : Color = .systemBackgroudColor
    
    //TO manage font by slider
    var fontsizeScaler : CGFloat = 1
    
    //show and hide scrollview Indicator
    var showScrollIndicator : Bool = true
    
    // horizontal padding of text content
    var paddingHorizontal : CGFloat = 16
    
    //spacing between lines in pragraph
    var textLineSpacing : CGFloat = 2
    
    var coverHeight : CGFloat =  UIDevice.current.isPad ?  300 : UIScreen.main.bounds.width
    
    var fontName : String?
    
    var coverImage : UIImage?
    var content : [BlogCantent]
    
    public init(coverImage : UIImage?,content: [BlogCantent]) {
        self.coverImage = coverImage
        self.content = content
    }
    
    public var body: some View {
        ZStack{
            
            VStack{
                if let img = self.coverImage{
                    Image(uiImage: img)
                        .resizable().aspectRatio(contentMode: .fill)
                        .fullWidth(height: coverHeight)
                        .overlay(VStack{
                            LinearGradient(colors: [backgroundColor.opacity(0.6),backgroundColor.opacity(0)], startPoint: .top, endPoint: .bottom)
                                .fullWidth(height: BlogView.notchHeight)
                            
                            Spacer()
                            
                            Spacer()
                            .fullWidth(height: 80)
                            .background(LinearGradient(colors: [backgroundColor.opacity(0),backgroundColor], startPoint: .top, endPoint: .bottom))
                            
                           
                                
                        })
                        .clipped()
                }
                
                
                Spacer()
            }
            
            
            ScrollView(.vertical,showsIndicators: showScrollIndicator) {
            
                C_lazyVstack(spacing: 16) {
                    
                    Spacer()
                        .fullWidth(height: coverHeight)
                        .padding(.bottom,-50)
                   
                    ForEach(content,id: \.id) { content in
                        switch content.ContentType {
                        case .title(_),.headline(_),.subheadline(_),.caption(_),.caption2(_) :
                            TextContent(type: content.ContentType)
                            
                        case .image(let provider,let source):
                            ImageView(provider: provider, source: source)
                            
                            
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
//                        case .customView(let C_View):
//                            C_View
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
                .padding(.horizontal,paddingHorizontal)
                
            }
            
        }
        .background(backgroundColor)
        .ignoreSafeArea_C()
    }
}

