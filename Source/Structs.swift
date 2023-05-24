//
//  Structs.swift
//  BlogEasy
//
//  Created by Moksh on 22/05/23.
//

import Foundation
import SwiftUI

public let defaultTextConfig : TextConfig = .init(color: Color.systemTextColor, UnderLine: false, smallCaps: false, opacity: 1, alignment: .leading)


public struct BlogCantent : Identifiable {
    public var id = UUID()
    var ContentType : BlogCantentType
    
    public init(ContentType: BlogCantentType) {
        self.ContentType = ContentType
    }
}

public enum BlogCantentType {
    case title(value : String,config : TextConfig = defaultTextConfig)
    case headline(value : String,config : TextConfig = defaultTextConfig)
    case subheadline(value : String,config : TextConfig = defaultTextConfig)
    case caption(value :String,config : TextConfig = defaultTextConfig)
    case caption2(value : String,config : TextConfig = defaultTextConfig)
    case image(image : imageProvider,config : ImageConfig = .init())
    case bullet(bulletImage : UIImage,value : String)
    case TextBullet(BulletString : String, value :String)
    case divider
    case link(text: String,url: String)
    case EmptyView
    case spacer(height : CGFloat = 10)
}


public struct TextConfig {
    var color : Color
    var UnderLine : Bool
    var smallCaps : Bool
    var opacity : CGFloat
    var alignment : TextAlignment
    
    public init(color: Color, UnderLine: Bool, smallCaps: Bool, opacity: CGFloat, alignment: TextAlignment) {
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


