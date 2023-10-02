//
//  BlogView.swift
//  BlogEasy
//
//  Created by Moksh on 22/05/23.
//

import SwiftUI
import Kingfisher
import Highlightr


public struct BlogView: View {
    //backgroud color
    var backgroundColor : Color = .systemBackgroudColor
    var textColor : Color = .systemTextColor
    
    
    //TO manage font by slider
    var fontsizeScaler : CGFloat = 0
    
    //show and hide scrollview Indicator
    var showScrollIndicator : Bool = true
    
    // horizontal padding of text content
    var paddingHorizontal : CGFloat = 16
    
    
    //spacing between lines in pragraph
    var textLineSpacing : CGFloat = 2
    
    //Accent Color
    var accentColor : Color = Color.accentColor
    
    //Cover Gradient Color
    var showCoverGradient : Bool = true
    
    var coverScrollOpacity : CGFloat = 0.4
    
    var coverHeight : CGFloat =  UIDevice.current.isPad ?  300 : UIScreen.main.bounds.width
    
    var fontName : String?
    
    //scroll values for Scroll animation
    @State var ScrollPer : CGFloat = .zero
    @State var strachValue : CGFloat = .zero
    @State var scrollBufferSize = (UIDevice.current.isPad ?  300 : UIScreen.main.bounds.width) - (UIDevice.current.notchSize + 60)
    @State var scrollPosition : CGFloat = .zero
    @State var coverOpacity : CGFloat = 1
    
    
    var coverImage : imageProvider?
    var blogData : BlogData
    
    var backButtonAction : (() -> Void)?
    
    public init(data : BlogData) {
        self.blogData = data
    }
    
    @ViewBuilder
    var backButtonView : some View {
        Button {
            if let backAction = backButtonAction {
                backAction()
            }
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
                .fullWidth(height: 55)
                
            }
            .background(BlurView(style: .systemUltraThinMaterial).opacity(ScrollPer))
            
            Spacer()
        }
       
    }
    
    
    
    @ViewBuilder var Content_scrollView : some View{
        ZStack{
            ScrollView(.vertical,showsIndicators: showScrollIndicator) {
            
                C_lazyVstack(spacing: 16) {
                    
                    Spacer()
                        .fullWidth(height: coverHeight)
                        .padding(.bottom,-50)
                   
                    ForEach(blogData.content,id: \.id) { content in
                        switch content.ContentType {
                        case .title(_,_),.headline(_,_),.subheadline(_,_),.caption(_,_),.caption2(_,_),.customText(_,_) :
                            TextContent(type: content.ContentType)
                       case .image(let provider,let config):
                            ImageView(provider: provider, config: config)
                        case .bullet(let value,let config):
                            BulletPoint(value: value, config: config)
                        case .divider:
                            Divider()
                        case .codeView(let value):
                            CodeEditorView(text: value,showCopyBtn: false)
                           
                           
                        case .link(let text,let url):
                           linkView(text: text, url: url)
    //                        case .customView(let C_View):
    //                            C_View
                        case .EmptyView:
                            EmptyView()
                        case .spacer(let height):
                            Spacer()
                                .fullWidth(height: height)
                        
                        case .linkPreview(let type, let url):
                            if let url = URL(string: url){
                                LinkPreview(url: url)
                                    .type(type)
                                    .padding(.horizontal,paddingHorizontal)
                            } else {
                                EmptyView()
                            }
                           
                        }
                    }
                    
                    Spacer().bottomSafeArea(ifZero: 15)
                   
                }
                .getScrollPosition(key: "blogScroll", handler: self.scrollViewDidScroll(value:))
                
                
            }
    //            .coordinateSpace(name: "blogScroll")
            
        }
        .fullFrame()
       
    }
    
    
    public var body: some View {
        ZStack{
            
            VStack{
                CoverImage()
                Spacer()
            }
            
            Content_scrollView
            
            navigationView
            
        }
        .background(self.blogData.backgroudColor?.getColor() ?? backgroundColor)
       
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
