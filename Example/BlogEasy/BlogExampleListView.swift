//
//  BlogExampleListView.swift
//  BlogEasy_Example
//
//  Created by Moksh Suthar on 26/05/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import SwiftUI
import BlogEasy
import Kingfisher

struct BlogExampleListView: View {
    @StateObject var model : BlogExampleListVC
    
    var body: some View {
        ZStack{
            
            ScrollView(.vertical,showsIndicators: false) {
                VStack(spacing : 16){
                    Spacer()
                        .fullWidth(height: UIDevice.current.notchSize + 90)
                    
                    Text("Simple Blogs")
                        .font(.headline)
                        .fontWeight(.bold)
                        .fullWidth(alignment: .leading)
                        .opacity(0.5)
                    
                    VStack{
                        Image("sempleBlogCover")
                            .resizable().aspectRatio(contentMode: .fill)
                            .fullWidth(height: 200)
                        
                        HStack{
                            Text("Introducing BlogEasy: Simplify Your iOS Blog Views")
                                .font(.headline)
                                .foregroundColor(Color.white)
                                .fullWidth(alignment: .leading)
                        }
                        .padding()
                        .fullWidth()
                        .background(BlurView(style: .systemUltraThinMaterialLight))
                        
                    }
                    .fullWidth()
                    .cornerRadius(20)
                    .onTapGesture {
                        self.model.OpenBlog = model.sempleEasyBlog
                    }
                    
                    HStack(spacing : 0){
                        KFImage(URL(string: "https://i.pinimg.com/564x/f2/69/74/f26974c63e5be41d3dcbd21540fd1e40.jpg"))
                            .resizable().aspectRatio(contentMode: .fill)
                            .squareFrame(size: 90)
                            .clipped()
                        
                        VStack{
                            Text("Unleash the Power of Performance")
                                .font(.headline)
                                .foregroundColor(Color.white)
                                .fullWidth(alignment: .leading)
                            
                            Text("Introducing the Porsche 911 Turbo")
                                .font(.caption)
                                .foregroundColor(Color.white)
                                .fullWidth(alignment: .leading)
                        }
                        .padding(10)
                        .fullFrame(alignment: .topLeading)
                        .background(BlurView(style: .systemUltraThinMaterialLight))
                        
                    }
                    .fullWidth(height: 90)
                    .cornerRadius(20)
                    .onTapGesture {
                        self.model.OpenBlog = model.porcheBlog
                    }
                    
//                    ForEach((0...10).indices,id: \.self) { i in
//                        Rectangle()
//                            .fill(Color.white.opacity(0.3))
//                            .fullWidth(height: 200)
//                            .cornerRadius(20)
//                    }
                    
                }
                .padding(.horizontal)
                .getScrollPosition(key: "exampleScroll", handler: model.scrollViewDidScroll(value:))
            }
            .coordinateSpace(name: "exampleScroll")
          
            
            
            VStack{
                VStack{
                    Spacer()
                        .adjustForNotch(plus: 40 * (1 - model.ScrollPer) + model.strachValue)
                    
                    HStack{
                        Text("Example Blogs")
                            .font(.system(size: 35 - 10 * model.ScrollPer + model.strachValue/20))
                            .foregroundColor(Color.systemTextColor)
                            .fontWeight(.bold)
                            .fullWidth(alignment: .leading)
                    }.padding(.horizontal)
                    .padding(.bottom,10)
                    .fullWidth(height: 50)
                }
                .background(BlurView(style: .systemUltraThinMaterial).opacity(model.ScrollPer))
                
                Spacer()
            }
            
           
           
        }
        .fullFrame()
        .background(Color.systemBackgroudColor)
        .ignoresSafeArea()
        .fullScreenCover(item: $model.OpenBlog) { blogData in
            BlogOpenView(data: blogData)
        }
        
        
    }
}
