//
//  LinkPreviewDesign.swift
//  
//
//  Created by 이웅재 on 2021/12/08.
//

import SwiftUI
import LinkPresentation
import MobileCoreServices

struct LinkPreviewDesign: View {
    let metaData: LPLinkMetadata
    let type: LinkPreviewType
    
    @State private var image: UIImage? = nil
    @State private var icon: UIImage? = nil
    @State private var isPresented: Bool = false
    
    private let backgroundColor: Color
    private let primaryFontColor: Color
    private let secondaryFontColor: Color
    private let titleLineLimit: Int
    
    init(metaData: LPLinkMetadata, type: LinkPreviewType = .auto, backgroundColor: Color, primaryFontColor: Color, secondaryFontColor: Color, titleLineLimit: Int) {
        self.metaData = metaData
        self.type = type
        self.backgroundColor = backgroundColor
        self.primaryFontColor = primaryFontColor
        self.secondaryFontColor = secondaryFontColor
        self.titleLineLimit = titleLineLimit
    }
    
    var body: some View {
        Group{
        switch type {
        case .small:
            smallType
        case .large:
            largeType
        case .auto:
            largeType
        }
        }
        .onAppear {
            getIcon()
            getImage()
        }
    }
    
    @ViewBuilder
    var smallType: some View {
        HStack(alignment: .top, spacing: 8){
            if let img = image {
                Image(uiImage: img)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .squareFrame(size: 45)
                    .clipped()
                    .cornerRadius(6)
            }
            else {
                Image(systemName: "arrow.up.forward.app.fill")
                    .resizable()
                    .foregroundColor(secondaryFontColor)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24, alignment: .center)
            }
            
            VStack(alignment: .leading, spacing: 0){
                if let title = metaData.title {
                    Text(title)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .minimumScaleFactor(0.8)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(primaryFontColor)
                        .lineLimit(titleLineLimit)
                }
                
                if let url = metaData.url?.host {
                    Text("\(url)")
                        .foregroundColor(secondaryFontColor)
                        .font(.footnote)
                }
            }
            .fullWidth(alignment: .leading)
         }
        .padding(.horizontal, 8)
        .padding(.vertical, 8)
        .fullWidth(height: 60)
        .background(
            Rectangle()
                .foregroundColor(backgroundColor)
        )
        .cornerRadius(12)
    }
    
    @ViewBuilder
    var largeType: some View {
        VStack(alignment: .leading, spacing: 0){
            if let img = image {
                ZStack(alignment: .bottomTrailing){
                Image(uiImage: img)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    
                    if let icon = icon {
                        Image(uiImage: icon)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 32, height: 32, alignment: .center)
                            .cornerRadius(6)
                            .padding(.all, 8)
                    }
                }
                
            }
            
            HStack(spacing: 8){
            VStack(alignment: .leading, spacing: 0){
                if let title = metaData.title {
                    Text(title)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(primaryFontColor)
                        .lineLimit(titleLineLimit)
                        .padding(.bottom, image == nil ? 0 : 4)
                }
                
                if let url = metaData.url?.host {
                    Text("\(url)")
                        .foregroundColor(secondaryFontColor)
                        .font(.footnote)
                }
            }
                
                if image != nil {
                    Spacer()
                }
                else {
                    Image(systemName: "arrow.up.forward.app.fill")
                        .resizable()
                        .foregroundColor(secondaryFontColor)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24, alignment: .center)
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(
                Rectangle()
                    .foregroundColor(backgroundColor)
            )
        }
        .cornerRadius(12)
    }
    
    func getImage(){
        let IMAGE_TYPE = kUTTypeImage as String
        metaData.imageProvider?.loadFileRepresentation(forTypeIdentifier: IMAGE_TYPE, completionHandler: { (url, imageProviderError) in
            if imageProviderError != nil {
                
            }
            guard let data = url?.path else { return }
            self.image = UIImage(contentsOfFile: (data))
        })
    }
    func getIcon(){
        let IMAGE_TYPE = kUTTypeImage as String
        metaData.iconProvider?.loadFileRepresentation(forTypeIdentifier: IMAGE_TYPE, completionHandler: { (url, imageProviderError) in
            if imageProviderError != nil {
                
            }
            guard let data = url?.path else { return }
            self.icon = UIImage(contentsOfFile: (data))
        })
    }
}


public enum LinkPreviewType {
    case small
    case large
    case auto
    
    func rawValue() -> String {
        switch self {
        case .small:
            return "small"
        case .large:
            return "large"
        case .auto:
            return "auto"
        }
    }
}
