//
//  Structs.swift
//  BlogEasy
//
//  Created by Moksh on 22/05/23.
//

import Foundation
import SwiftUI

public struct BlogCantent : Identifiable {
    public var id = UUID()
    var ContentType : BlogCantentType
    
    public init(ContentType: BlogCantentType) {
        self.ContentType = ContentType
    }
}

public enum BlogCantentType {
    case title(value : String,config : TextConfig = .init(size: 26, fontWeight: .heavy))
    case headline(value : String,config : TextConfig = .init(size: 21, fontWeight: .semibold))
    case subheadline(value : String,config : TextConfig = .init(size: 18, fontWeight: .regular))
    case caption(value :String,config : TextConfig = .init(size: 16, fontWeight: .light))
    case caption2(value : String,config : TextConfig = .init(size: 14, fontWeight: .light))
    case image(image : imageProvider,config : ImageConfig = .init())
    case bullet(value : String,config : BulletPointConfig = .init())
    case CodeBlock(value : String)
    case divider
    case link(text: String,url: String)
    case EmptyView
    case spacer(height : CGFloat = 10)
}


public struct TextConfig {
    var size : CGFloat
    var fontWeight : Font.Weight
    var color : Color
    var UnderLine : Bool
    var smallCaps : Bool
    var opacity : CGFloat
    
    var alignment : TextAlignment
    
    public init(size : CGFloat = 20,fontWeight : Font.Weight = .regular ,color: Color = .systemTextColor, UnderLine: Bool = false, smallCaps: Bool = false, opacity: CGFloat = 1, alignment: TextAlignment = .leading) {
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


