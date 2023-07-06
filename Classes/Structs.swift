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
//    var title : String
    var coverImage : imageProvider?
    var content : [BlogCantent]
    
    public init(coverImage : imageProvider?,content: [BlogCantentType]) {
        self.coverImage = coverImage
        self.content = content.asBlogContent()
        
    }
    
    public init(_ dict : [String : Any]) {
        self.coverImage = dict.getImageProvider("coverImage")
        self.content = dict.getBlogContent("content")
    }
    
    
    public func getDict() -> [String : Any] {
        var dataToReturn : [String : Any] = [:]
        
        dataToReturn["title"] = "title"
        
        if let coverImage {
            dataToReturn["coverImage"] = coverImage.getDict()
        }
      
        var contentDictArray : [[String : Any]] = []
         
        for item in content{
            contentDictArray.append(item.ContentType.getDict())
        }
        dataToReturn["content"] = contentDictArray
        
        return dataToReturn
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
    case customText(value : String,config : CustomTextConfig)
    case image(image : imageProvider,config : ImageConfig = .init())
    case bullet(value : String,config : BulletPointConfig = .init())
    case divider
    case codeView (value: String)
    case link(text: String,url: String)
    case EmptyView
    case spacer(height : CGFloat = 10)
    case linkPreview(type : LinkPreviewType = .auto, url : String)
}



extension BlogCantentType {
    func getDict() -> [String : Any] {
        var dicValue : [String : Any] = [:]
        
        switch self {
        case .title(let value, let config):
            dicValue["type"] = "title"
            dicValue["value"] = value
            dicValue["config"] = config.dict()
            
        case .headline(let value, let config):
            dicValue["type"] = "headline"
            dicValue["value"] = value
            dicValue["config"] = config.dict()
            
        case .subheadline(let value, let config):
            dicValue["type"] = "subheadline"
            dicValue["value"] = value
            dicValue["config"] = config.dict()
            
        case .caption(let value, let config):
            dicValue["type"] = "caption"
            dicValue["value"] = value
            dicValue["config"] = config.dict()
           
        case .caption2(let value, let config):
            dicValue["type"] = "caption2"
            dicValue["value"] = value
            dicValue["config"] = config.dict()
           
        case .customText(let value, let config):
            dicValue["type"] = "customText"
            dicValue["value"] = value
            dicValue["config"] = config.dict()
            
        case .image(let image, let config):
            dicValue["type"] = "image"
            dicValue["value"] = image.getDict()
            dicValue["config"] = config.dict()
        
        case .bullet(let value, let config):
            dicValue["type"] = "bullet"
            dicValue["value"] = value
            dicValue["config"] = config.getDict()
        case .divider:
            dicValue["type"] = "divider"
        case .codeView(let value):
            dicValue["type"] = "codeView"
            dicValue["value"] = value
        case .link(let text, let url):
            dicValue["type"] = "link"
            dicValue["text"] = text
            dicValue["url"] = url
        case .EmptyView:
            dicValue["type"] = "EmptyView"
        case .spacer(let height):
            dicValue["type"] = "spacer"
            dicValue["text"] = height
        case .linkPreview(let type, let url):
            dicValue["type"] = "linkPreview"
            dicValue["viewType"] = type.rawValue()
            dicValue["url"] = url
        }

        return dicValue
    }
}

public enum colorProvider {
    case defaultColor(_ alpha : Double = 1)
    case color(_ color : Color,_ alpha : Double = 1)
    case uicolor(_ color : UIColor,_ alpha : Double = 1)
    case name(_ name : String,_ alpha : Double = 1)
    case hex(_ hexCode : String,_ alpha : Double = 1)
    
    func getColor() -> Color {
        switch self {
        case .color(let color,let alpha):
            return color.opacity(alpha)
        case .uicolor(let uicolor,let alpha):
            return Color(uicolor.withAlphaComponent(alpha))
        case .name(let name,let alpha):
            return Color(name).opacity(alpha)
        case .hex(let hex, let alpha):
            return Color(hex: hex,alpha: alpha)
        case .defaultColor(let alpha):
            return Color(UIColor(light: .black, dark: .white).withAlphaComponent(alpha))
        }
    }
    
    func ColorDict() -> [String: Any] {
        var colorDict : [String : Any] = [:]
        switch self {
        case .color(let colorValue,let alpha):
            colorDict["providerType"] = "color"
            colorDict["value"] = colorValue.rawValue()
            colorDict["alpha"] = alpha
        case .uicolor(let uiColorValue,let alpha):
            colorDict["providerType"] = "uicolor"
            colorDict["value"] = uiColorValue.rawValue()
            colorDict["alpha"] = alpha
        case .name(let name,let alpha):
            colorDict["providerType"] = "name"
            colorDict["value"] = name
            colorDict["alpha"] = alpha
        case .hex(let hexCode, let alpha):
            colorDict["providerType"] = "hexCode"
            colorDict["value"] = hexCode
            colorDict["alpha"] = alpha
        case .defaultColor(let alpha):
            colorDict["providerType"] = "defaultColor"
            colorDict["alpha"] = alpha
        }
        return colorDict
    }
}
//title Config
public struct TitleTextConfig {
    var size : CGFloat = 26
    var fontWeight : Font.Weight = .heavy
    var color : colorProvider =  .defaultColor()
    var UnderLine : Bool = false
    var smallCaps : Bool = false
    var opacity : CGFloat = 1
    var alignment : TextAlignment = .leading
    
    public init(){ }
    
    public init(size: CGFloat = 26, fontWeight: Font.Weight = .heavy, color: colorProvider = .defaultColor(), UnderLine: Bool = false, smallCaps: Bool = false, opacity: CGFloat = 1, alignment: TextAlignment = .leading) {
        self.size = size
        self.fontWeight = fontWeight
        self.color = color
        self.UnderLine = UnderLine
        self.smallCaps = smallCaps
        self.opacity = opacity
        self.alignment = alignment
    }
    
    public init(_ dict : [String : Any]) {
        self.size = dict.getCGFloat("size",26)
        self.fontWeight =  dict.getFontWeight("fontWeight",.heavy)
        self.color = dict.getColor("color",.color(.systemTextColor))
        self.UnderLine = dict.getBool("UnderLine",false)
        self.smallCaps = dict.getBool("smallCaps",false)
        self.opacity = dict.getCGFloat("opacity",1)
        self.alignment = dict.getFontAlignment("alignment",.leading)
    }
    
    
    func dict() -> [String : Any] {
        var configDict : [String : Any] = [:]
        
        configDict["size"] = size
        configDict["fontWeight"] = self.fontWeight.rawValue()
        configDict["color"] = self.color.ColorDict()
        configDict["UnderLine"] = self.UnderLine
        configDict["smallCaps"] = self.smallCaps
        configDict["opacity"] = self.opacity
        configDict["alignment"] = self.alignment.rawValue()
        
        return configDict
    }
    
}
//Headline Config
public struct HeadlineTextConfig {
    var size : CGFloat = 21
    var fontWeight : Font.Weight = .bold
    var color : colorProvider =  .defaultColor()
    var UnderLine : Bool = false
    var smallCaps : Bool = false
    var opacity : CGFloat = 1
    var alignment : TextAlignment = .leading
    
    public init(){ }
    
    public init(size: CGFloat = 21, fontWeight: Font.Weight = .bold, color: colorProvider = .defaultColor(), UnderLine: Bool = false, smallCaps: Bool = false, opacity: CGFloat = 1, alignment: TextAlignment = .leading) {
        self.size = size
        self.fontWeight = fontWeight
        self.color = color
        self.UnderLine = UnderLine
        self.smallCaps = smallCaps
        self.opacity = opacity
        self.alignment = alignment
    }
    
    public init(_ dict : [String : Any]) {
        self.size = dict.getCGFloat("size",21)
        self.fontWeight =  dict.getFontWeight("fontWeight",.bold)
        self.color = dict.getColor("color",.color(.systemTextColor))
        self.UnderLine = dict.getBool("UnderLine",false)
        self.smallCaps = dict.getBool("smallCaps",false)
        self.opacity = dict.getCGFloat("opacity",1)
        self.alignment = dict.getFontAlignment("alignment",.leading)
    }
    
    func dict() -> [String : Any] {
        var configDict : [String : Any] = [:]
        
        configDict["size"] = size
        configDict["fontWeight"] = self.fontWeight.rawValue()
        configDict["color"] = self.color.ColorDict()
        configDict["UnderLine"] = self.UnderLine
        configDict["smallCaps"] = self.smallCaps
        configDict["opacity"] = self.opacity
        configDict["alignment"] = self.alignment.rawValue()
        
        return configDict
    }
    
}
//Subheadline Config
public struct SubheadlineTextConfig {
    var size : CGFloat = 18
    var fontWeight : Font.Weight = .regular
    var color : colorProvider =  .defaultColor()
    var UnderLine : Bool = false
    var smallCaps : Bool = false
    var opacity : CGFloat = 1
    var alignment : TextAlignment = .leading
    
    public init(){ }
    
    public init(size: CGFloat = 18, fontWeight: Font.Weight = .regular, color: colorProvider = .defaultColor(), UnderLine: Bool = false, smallCaps: Bool = false, opacity: CGFloat = 1, alignment: TextAlignment = .leading) {
        self.size = size
        self.fontWeight = fontWeight
        self.color = color
        self.UnderLine = UnderLine
        self.smallCaps = smallCaps
        self.opacity = opacity
        self.alignment = alignment
    }
    
    public init(_ dict : [String : Any]) {
        self.size = dict.getCGFloat("size",18)
        self.fontWeight =  dict.getFontWeight("fontWeight",.regular)
        self.color = dict.getColor("color",.color(.systemTextColor))
        self.UnderLine = dict.getBool("UnderLine",false)
        self.smallCaps = dict.getBool("smallCaps",false)
        self.opacity = dict.getCGFloat("opacity",1)
        self.alignment = dict.getFontAlignment("alignment",.leading)
    }
    
    func dict() -> [String : Any] {
        var configDict : [String : Any] = [:]
        
        configDict["size"] = size
        configDict["fontWeight"] = self.fontWeight.rawValue()
        configDict["color"] = self.color.ColorDict()
        configDict["UnderLine"] = self.UnderLine
        configDict["smallCaps"] = self.smallCaps
        configDict["opacity"] = self.opacity
        configDict["alignment"] = self.alignment.rawValue()
        
        return configDict
    }
}
//caption Config
public struct captionTextConfig {
    var size : CGFloat = 16
    var fontWeight : Font.Weight = .light
    var color : colorProvider =  .defaultColor()
    var UnderLine : Bool = false
    var smallCaps : Bool = false
    var opacity : CGFloat = 0.8
    var alignment : TextAlignment = .leading
    
    public init(){
        
    }
    
    public init(size: CGFloat = 16, fontWeight: Font.Weight = .light, color: colorProvider = .defaultColor(), UnderLine: Bool = false, smallCaps: Bool = false, opacity: CGFloat = 0.8, alignment: TextAlignment = .leading) {
        self.size = size
        self.fontWeight = fontWeight
        self.color = color
        self.UnderLine = UnderLine
        self.smallCaps = smallCaps
        self.opacity = opacity
        self.alignment = alignment
    }
    
    public init(_ dict : [String : Any]) {
        self.size = dict.getCGFloat("size",16)
        self.fontWeight =  dict.getFontWeight("fontWeight",.light)
        self.color = dict.getColor("color",.color(.systemTextColor))
        self.UnderLine = dict.getBool("UnderLine",false)
        self.smallCaps = dict.getBool("smallCaps",false)
        self.opacity = dict.getCGFloat("opacity",0.8)
        self.alignment = dict.getFontAlignment("alignment",.leading)
    }
    
    func dict() -> [String : Any] {
        var configDict : [String : Any] = [:]
        
        configDict["size"] = size
        configDict["fontWeight"] = self.fontWeight.rawValue()
        configDict["color"] = self.color.ColorDict()
        configDict["UnderLine"] = self.UnderLine
        configDict["smallCaps"] = self.smallCaps
        configDict["opacity"] = self.opacity
        configDict["alignment"] = self.alignment.rawValue()
        
        return configDict
    }
}
//caption2 Config
public struct caption2TextConfig {
    var size : CGFloat = 14
    var fontWeight : Font.Weight = .light
    var color : colorProvider = .defaultColor()
    var UnderLine : Bool = false
    var smallCaps : Bool = false
    var opacity : CGFloat = 0.8
    var alignment : TextAlignment = .leading
    
    public init(){
        
    }
    
    public init(size: CGFloat = 14, fontWeight: Font.Weight = .light, color : colorProvider =  .defaultColor(), UnderLine: Bool = false, smallCaps: Bool = false, opacity: CGFloat = 0.8, alignment: TextAlignment = .leading) {
        self.size = size
        self.fontWeight = fontWeight
        self.color = color
        self.UnderLine = UnderLine
        self.smallCaps = smallCaps
        self.opacity = opacity
        self.alignment = alignment
    }
    
    public init(_ dict : [String : Any]) {
        self.size = dict.getCGFloat("size",14)
        self.fontWeight =  dict.getFontWeight("fontWeight",.light)
        self.color = dict.getColor("color",.color(.systemTextColor))
        self.UnderLine = dict.getBool("UnderLine",false)
        self.smallCaps = dict.getBool("smallCaps",false)
        self.opacity = dict.getCGFloat("opacity",0.8)
        self.alignment = dict.getFontAlignment("alignment",.leading)
    }
    
    func dict() -> [String : Any] {
        var configDict : [String : Any] = [:]
        
        configDict["size"] = size
        configDict["fontWeight"] = self.fontWeight.rawValue()
        configDict["color"] = self.color.ColorDict()
        configDict["UnderLine"] = self.UnderLine
        configDict["smallCaps"] = self.smallCaps
        configDict["opacity"] = self.opacity
        configDict["alignment"] = self.alignment.rawValue()
        
        return configDict
    }
}
//custom Text Config
public struct CustomTextConfig {
    var size : CGFloat
    var fontWeight : Font.Weight
    var color : colorProvider =  .color(.systemTextColor)
    var UnderLine : Bool
    var smallCaps : Bool
    var opacity : CGFloat
    
    var alignment : TextAlignment
    
    public init(size : CGFloat,fontWeight : Font.Weight,color: colorProvider, UnderLine: Bool, smallCaps: Bool, opacity: CGFloat, alignment: TextAlignment) {
        self.size = size
        self.fontWeight = fontWeight
        self.color = color
        self.UnderLine = UnderLine
        self.smallCaps = smallCaps
        self.opacity = opacity
        self.alignment = alignment
    }
    
    public init(_ dict : [String : Any]) {
        self.size = dict.getCGFloat("size",14)
        self.fontWeight =  dict.getFontWeight("fontWeight",.light)
        self.color = dict.getColor("color",.color(.systemTextColor))
        self.UnderLine = dict.getBool("UnderLine",false)
        self.smallCaps = dict.getBool("smallCaps",false)
        self.opacity = dict.getCGFloat("opacity",1)
        self.alignment = dict.getFontAlignment("alignment",.leading)
    }
   
    func dict() -> [String : Any] {
        var configDict : [String : Any] = [:]
        
        configDict["size"] = size
        configDict["fontWeight"] = self.fontWeight.rawValue()
        configDict["color"] = self.color.ColorDict()
        configDict["UnderLine"] = self.UnderLine
        configDict["smallCaps"] = self.smallCaps
        configDict["opacity"] = self.opacity
        configDict["alignment"] = self.alignment.rawValue()
        
        return configDict
    }
}

public struct ImageConfig {
    
    var cornerRadius : CGFloat
    var showShadow : Bool
    var aspectMode : ContentMode
    var backgroundColor : colorProvider
    var source : imageSource?
    
    public init(cornerRadius: CGFloat = 20, showShadow: Bool = false, aspectMode: ContentMode = .fit, backgroundColor: colorProvider = .color(.clear),source : imageSource? = nil) {
        self.cornerRadius = cornerRadius
        self.showShadow = showShadow
        self.aspectMode = aspectMode
        self.backgroundColor = backgroundColor
        self.source = source
    }
    
    public init(_ dict : [String : Any]) {
        self.cornerRadius = dict.getCGFloat("cornerRadius",20)
        self.showShadow = dict.getBool("showShadow",false)
        self.aspectMode = dict.getAspectMode("aspectMode",.fit)
        self.backgroundColor = dict.getColor("backgroundColor",.color(.clear))
        self.source = dict.getImageSource("source")
    }
    
    func dict() -> [String : Any] {
        var config : [String : Any] = [:]
        config["cornerRadius"] = cornerRadius
        config["showShadow"] = showShadow
        config["aspectMode"] = aspectMode.rawValue()
        config["backgroundColor"] = backgroundColor.ColorDict()
        if let source {
            config["source"] = source.getDict()
        } else {
            config["source"] = [:] as [String : Any]
        }
        
        return config
    }
    
    
}

public struct BulletPointConfig{
    var bulletType : BulletPointType
    var fontSize : CGFloat
    var fontWeight : Font.Weight
    var textColor : colorProvider?
    var UnderLine : Bool
    var smallCaps : Bool
    var opacity : CGFloat
    
    public init(bulletType: BulletPointType = .systemImage(name: "circle.fill"),fontSize: CGFloat = 16, fontWeight: Font.Weight = .light, textColor: colorProvider? = nil, UnderLine: Bool = false, smallCaps: Bool = false, opacity: CGFloat = 1) {
        self.bulletType = bulletType
        self.fontSize = fontSize
        self.fontWeight = fontWeight
        self.textColor = textColor
        self.UnderLine = UnderLine
        self.smallCaps = smallCaps
        self.opacity = opacity
    }
    
    public init(_ dict : [String : Any]) {
        self.bulletType = dict.getBulletPointType()
        self.fontSize = dict.getCGFloat("fontSize",16)
        self.fontWeight = dict.getFontWeight("fontWeight",.light)
        if let colorP = dict["textColor"] as? [String : Any] {
            self.textColor = dict.getColor("textColor")
        } else {
            self.textColor = nil
        }
        self.UnderLine = dict.getBool("UnderLine")
        self.smallCaps = dict.getBool("smallCaps")
        self.opacity = dict.getCGFloat("opacity")
    }
    
    func getDict() -> [String : Any]{
        var configDict : [String : Any] = [:]
        configDict["bulletType"] = self.bulletType.getDict()
        configDict["fontSize"] = fontSize
        configDict["fontWeight"] = fontWeight.rawValue()
        if let textColor {
            configDict["textColor"] = textColor.ColorDict()
        }
        configDict["UnderLine"] = UnderLine
        configDict["smallCaps"] = smallCaps
        configDict["opacity"] = opacity
       
        return configDict
    }
    
}

public enum BulletPointType {
    case systemImage(name : String,color : colorProvider? = nil)
    case Text(value : String,color : colorProvider? = nil,isContinueLine : Bool = true)
    
    func getDict() -> [String : Any] {
        var configDict : [String : Any] = [:]
        
        switch self {
        case .systemImage(let name, let color):
            configDict["type"] = "systemImage"
            configDict["name"] = name
            if let color {
                configDict["color"] = color.ColorDict()
            }
          
        case .Text(let value, let color, let isContinueLine):
            configDict["type"] = "Text"
            configDict["value"] = value
            configDict["isContinueLine"] = isContinueLine
            if let color {
                configDict["color"] = color.ColorDict()
            }
            
        }
        return configDict
    }
    
    
}

public enum imageProvider {
    case uiimage(name : String)
    case url(url : String)
    
    func getDict() -> [String : Any] {
        var dict : [String : Any] = [:]
        switch self {
        case .uiimage(let name):
            dict["providerType"] = "uiImage"
            dict["value"] = name
        case .url(let url):
            dict["providerType"] = "url"
            dict["value"] = url
        }
        
        return dict
       
    }
}

public struct imageSource  {
    var text : String
    var url : String?
    
    public init(text: String,url : String? = nil) {
        self.text = text
        self.url = url
    }
    
    func getDict() -> [String : Any] {
        var dict : [String : Any] = [:]
        
        dict["text"] = text
        dict["url"] = url ?? ""
        
        return dict
    }
}


