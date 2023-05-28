//
//  Structs.swift
//  BlogEasy
//
//  Created by Moksh on 22/05/23.
//

import Foundation
import SwiftUI

public struct BlogData : Identifiable {
    public var id = UUID()
    var coverImage : imageProvider?
    var content : [BlogCantent]
    
    public init(coverImage : imageProvider?,content: [BlogCantentType]) {
        self.coverImage = coverImage
        self.content = content.asBlogContent()
        
    }
}

public struct BlogCantent : Identifiable {
    public var id = UUID()
    var ContentType : BlogCantentType
    
    public init(ContentType: BlogCantentType) {
        self.ContentType = ContentType
    }
}
extension [BlogCantentType] {
    func asBlogContent() -> [BlogCantent] {
        return self.map({BlogCantent(ContentType: $0)})
    }
}

public enum BlogCantentType {
    case title(value : String,config : TitleTextConfig = TitleTextConfig())
    case headline(value : String,config : HeadlineTextConfig = HeadlineTextConfig())
    case subheadline(value : String,config : SubheadlineTextConfig = SubheadlineTextConfig())
    case caption(value :String,config : captionTextConfig = captionTextConfig())
    case caption2(value : String,config : caption2TextConfig = caption2TextConfig())
    case customText(value : String,config : CoustomTextConfig)
    case image(image : imageProvider,config : ImageConfig = .init())
    case bullet(value : String,config : BulletPointConfig = .init())
    case CodeBlock(value : String)
    case divider
    case codeView (value: String)
    case link(text: String,url: String)
    case EmptyView
    case spacer(height : CGFloat = 10)
    case linkPreview(type : LinkPreviewType = .auto, url : String)
}

//title Config
public struct TitleTextConfig {
    var size : CGFloat = 26
    var fontWeight : Font.Weight = .heavy
    var color : Color = .systemTextColor
    var UnderLine : Bool = false
    var smallCaps : Bool = false
    var opacity : CGFloat = 1
    var alignment : TextAlignment = .leading
    
    public init(){
        
    }
    
    public init(size: CGFloat = 26, fontWeight: Font.Weight = .heavy, color: Color = .systemTextColor, UnderLine: Bool = false, smallCaps: Bool = false, opacity: CGFloat = 1, alignment: TextAlignment = .leading) {
        self.size = size
        self.fontWeight = fontWeight
        self.color = color
        self.UnderLine = UnderLine
        self.smallCaps = smallCaps
        self.opacity = opacity
        self.alignment = alignment
    }
    
    
}

public struct HeadlineTextConfig {
    var size : CGFloat = 21
    var fontWeight : Font.Weight = .bold
    var color : Color = .systemTextColor
    var UnderLine : Bool = false
    var smallCaps : Bool = false
    var opacity : CGFloat = 1
    var alignment : TextAlignment = .leading
    
    public init(){
        
    }
    
    public init(size: CGFloat = 21, fontWeight: Font.Weight = .bold, color: Color = .systemTextColor, UnderLine: Bool = false, smallCaps: Bool = false, opacity: CGFloat = 1, alignment: TextAlignment = .leading) {
        self.size = size
        self.fontWeight = fontWeight
        self.color = color
        self.UnderLine = UnderLine
        self.smallCaps = smallCaps
        self.opacity = opacity
        self.alignment = alignment
    }
    
    
}

public struct SubheadlineTextConfig {
    var size : CGFloat = 18
    var fontWeight : Font.Weight = .regular
    var color : Color = .systemTextColor
    var UnderLine : Bool = false
    var smallCaps : Bool = false
    var opacity : CGFloat = 1
    var alignment : TextAlignment = .leading
    
    public init(){
        
    }
    
    public init(size: CGFloat = 18, fontWeight: Font.Weight = .regular, color: Color = .systemTextColor, UnderLine: Bool = false, smallCaps: Bool = false, opacity: CGFloat = 1, alignment: TextAlignment = .leading) {
        self.size = size
        self.fontWeight = fontWeight
        self.color = color
        self.UnderLine = UnderLine
        self.smallCaps = smallCaps
        self.opacity = opacity
        self.alignment = alignment
    }
    
    
}

public struct captionTextConfig {
    var size : CGFloat = 16
    var fontWeight : Font.Weight = .light
    var color : Color = .systemTextColor
    var UnderLine : Bool = false
    var smallCaps : Bool = false
    var opacity : CGFloat = 0.8
    var alignment : TextAlignment = .leading
    
    public init(){
        
    }
    
    public init(size: CGFloat = 16, fontWeight: Font.Weight = .light, color: Color = .systemTextColor, UnderLine: Bool = false, smallCaps: Bool = false, opacity: CGFloat = 0.8, alignment: TextAlignment = .leading) {
        self.size = size
        self.fontWeight = fontWeight
        self.color = color
        self.UnderLine = UnderLine
        self.smallCaps = smallCaps
        self.opacity = opacity
        self.alignment = alignment
    }
    
    
}

public struct caption2TextConfig {
    var size : CGFloat = 14
    var fontWeight : Font.Weight = .light
    var color : Color = .systemTextColor
    var UnderLine : Bool = false
    var smallCaps : Bool = false
    var opacity : CGFloat = 0.8
    var alignment : TextAlignment = .leading
    
    public init(){
        
    }
    
    public init(size: CGFloat = 14, fontWeight: Font.Weight = .light, color: Color = .systemTextColor, UnderLine: Bool = false, smallCaps: Bool = false, opacity: CGFloat = 0.8, alignment: TextAlignment = .leading) {
        self.size = size
        self.fontWeight = fontWeight
        self.color = color
        self.UnderLine = UnderLine
        self.smallCaps = smallCaps
        self.opacity = opacity
        self.alignment = alignment
    }
    
    
}


public struct CoustomTextConfig {
    var size : CGFloat
    var fontWeight : Font.Weight
    var color : Color
    var UnderLine : Bool
    var smallCaps : Bool
    var opacity : CGFloat
    
    var alignment : TextAlignment
    
    public init(size : CGFloat,fontWeight : Font.Weight,color: Color, UnderLine: Bool, smallCaps: Bool, opacity: CGFloat, alignment: TextAlignment) {
        self.size = size
        self.fontWeight = fontWeight
        self.color = color
        self.UnderLine = UnderLine
        self.smallCaps = smallCaps
        self.opacity = opacity
        self.alignment = alignment
    }
    
   
    
}

public struct ImageConfig {
    
    var cornerRadius : CGFloat
    var showShadow : Bool
    var aspectMode : ContentMode
    var backgroundColor : Color
    var source : imageSource?
    
    public init(cornerRadius: CGFloat = 20, showShadow: Bool = false, aspectMode: ContentMode = .fit, backgroundColor: Color = .clear,source : imageSource? = nil) {
        self.cornerRadius = cornerRadius
        self.showShadow = showShadow
        self.aspectMode = aspectMode
        self.backgroundColor = backgroundColor
        self.source = source
    }
}

public struct BulletPointConfig{
    var bulletType : BulletPointType
    var fontSize : CGFloat
    var fontWeight : Font.Weight
    var textColor : Color?
    var UnderLine : Bool
    var smallCaps : Bool
    var opacity : CGFloat
    
    public init(bulletType: BulletPointType = .systemImage(name: "circle.fill"),fontSize: CGFloat = 16, fontWeight: Font.Weight = .light, textColor: Color? = nil, UnderLine: Bool = false, smallCaps: Bool = false, opacity: CGFloat = 1) {
        self.bulletType = bulletType
        self.fontSize = fontSize
        self.fontWeight = fontWeight
        self.textColor = textColor
        self.UnderLine = UnderLine
        self.smallCaps = smallCaps
        self.opacity = opacity
    }
    
}

public enum BulletPointType {
    case systemImage(name : String,color : Color? = nil)
    case Text(value : String,color : Color? = nil,isContinueLine : Bool = true)
}

public enum imageProvider {
    case uiimage(image : UIImage?)
    case url(url : String)
}

public struct imageSource  {
    var text : String
    var url : String?
    
    public init(text: String,url : String? = nil) {
        self.text = text
        self.url = url
    }
}


