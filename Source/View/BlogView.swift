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
    
    var coverScrollOpacity : CGFloat = 0.4
    
    var coverHeight : CGFloat =  UIDevice.current.isPad ?  300 : UIScreen.main.bounds.width
    
    var fontName : String?
    
    //scroll values for Scroll animation
    @State var ScrollPer : CGFloat = .zero
    @State var strachValue : CGFloat = .zero
    @State var scrollBufferSize = (UIDevice.current.isPad ?  300 : UIScreen.main.bounds.width) - (UIDevice.current.notchSize + 60)
    @State var scrollPosition : CGFloat = .zero
    @State var coverOpacity : CGFloat = 1
    
    
    var coverImage : UIImage?
    var content : [BlogCantent]
    
    public init(coverImage : UIImage?,content: [BlogCantent]) {
        self.coverImage = coverImage
        self.content = content
    }
    
    @ViewBuilder
    var backButtonView : some View {
        Button {
            
        } label: {
            systemIcon("arrow.left")
                .padding(10)
                .foregroundColor(Color.systemTextColor)
                .squareFrame(size: 40)
                .background(Color.systemBackgroudColor)
                .cornerRadius(20)
        }

    }
    
    @ViewBuilder
    var navigationView : some View {
        VStack{
            VStack(spacing : 0){
                Spacer()
                    .adjustForNotch()
                HStack{
                    backButtonView
                    
                    Spacer()
                }
                .padding(.horizontal)
                .fullWidth(height: 60)
                
            }
            .background(BlurView(style: .systemUltraThinMaterial).opacity(ScrollPer))
            
            Spacer()
        }
       
    }
    
    public var body: some View {
        ZStack{
            
            VStack{
                if let img = self.coverImage{
                    Image(uiImage: img)
                        .resizable().aspectRatio(contentMode: .fill)
                        .fullWidth(height: coverHeight + strachValue)
                        .overlay(VStack{
                            LinearGradient(colors: [backgroundColor.opacity(0.6),backgroundColor.opacity(0)], startPoint: .top, endPoint: .bottom)
                                .fullWidth(height: BlogView.notchHeight)
                            Spacer()
                            
                            LinearGradient(colors: [backgroundColor.opacity(0),backgroundColor], startPoint: .top, endPoint: .bottom)
                            .fullWidth(height: 80)
                        })
                        .cornerRadius(ScrollPer == 0 ? 0 : self.deviceCornerRadius())
                        .blur(radius: 10 * ScrollPer)
                        .opacity(coverOpacity)
                        .scaleEffect(1 + (0.5 * ScrollPer))
                    
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
                        case .title(_,_),.headline(_,_),.subheadline(_,_),.caption(_,_),.caption2(_,_) :
                            TextContent(type: content.ContentType)
                        case .image(let provider,let config):
                            ImageView(provider: provider, config: config)
                        case .bullet(let bulletImage,let value):
                            Text(value)
                        case .TextBullet(let BulletString, let value):
                            Text(value)
                        case .divider:
                            Divider()
                        case .link(let text,let url):
                            HStack{
                                Text(text)
                                
                                Text(url)
                                    .underline()
                                    .foregroundColor(Color.blue)
                                    .fullWidth( alignment: .leading)
                                    .onTapGesture {
                                        if let url = URL(string: url){
                                            UIApplication.shared.open(url)
                                        }
                                    }
                                    
                            }
                            .setFont(name: fontName, size: 14 + fontsizeScaler,weight: .light)
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
                    
                    Spacer().bottomSafeArea(ifZero: 15)
                   
                }
                .padding(.horizontal,paddingHorizontal)
                .getScrollPosition(key: "blogScroll", handler: self.scrollViewDidScroll(value:))
                
                
            }
            .coordinateSpace(name: "blogScroll")
            
            navigationView
            
        }
        .background(backgroundColor)
        .ignoreSafeArea_C()
    }
}


extension BlogView{
    
    
    func scrollViewDidScroll(value : CGFloat){
        if value < 0 {
            //scroll Down
            ScrollPer = .zero
            strachValue = -value
            scrollPosition = .zero
            
        } else if value > 0 {
            //scroll Up
            strachValue = .zero
            if value <= scrollBufferSize - 10 {
                ScrollPer =  value/scrollBufferSize
                scrollPosition = value
            } else {
                withAnimation(.linear(duration: 0.2)) {
                    ScrollPer = 1
                }
                scrollPosition = scrollBufferSize
            }
            
        } else {
            //scroll rest
            ScrollPer = 0
            scrollPosition = .zero
            strachValue = .zero
        }
        
        coverOpacity = 1 - (1 - coverScrollOpacity) * ScrollPer
    }
}
