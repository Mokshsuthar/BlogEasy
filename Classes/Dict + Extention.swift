//
//  Dict + Extention.swift
//  BlogEasy
//
//  Created by Moksh Suthar on 29/05/23.
//

import Foundation
import SwiftUI
import UIKit

extension Font.Weight {
    func rawValue() -> String {
        switch self {
        case .black :
            return "black"
        case .bold :
            return "bold"
        case .heavy :
            return "heavy"
        case .light :
            return "light"
        case .medium :
            return "medium"
        case .regular :
            return "regular"
        case .semibold :
            return "semibold"
        case .thin :
            return "thin"
        case .ultraLight :
            return "ultraLight"
        default:
            return "regular"
        }
    }
    
   
}


extension UIColor{
    
    func rawValue() -> String{
        switch self {
        case .red:
            return "Red"
        case .orange:
            return "Orange"
        case .yellow:
            return "Yellow"
        case .green:
            return "Green"
        case .blue:
            return "Blue"
        case .purple:
            return "Purple"
        case .brown:
            return "Brown"
        case .cyan:
            return "Cyan"
        case .magenta:
            return "Magenta"
        case .gray:
            return "Gray"
        case .white:
            return "White"
        case .black:
            return "Black"
        case .clear:
            return "Clear"
        default:
            if let colorCode = self.toHexCode() {
                return colorCode
            } else {
                return "systemBackgroudColor"
            }
        }
    }
    

}

extension ContentMode {
    func rawValue() -> String {
        switch self {
        case .fit:
            return "fit"
        case .fill:
            return "fill"
        }
    }
}

extension Color {
    func rawValue() -> String {
        switch self {
        case .systemBackgroudColor:
            return "systemBackgroudColor"
        case .systemTextColor:
            return "systemTextColor"
        case .accentColor:
            return "accentColor"
        case .black:
            return "black"
        case .white:
            return "white"
        case .blue:
            return "blue"
        case .clear:
            return "clear"
        case .gray:
            return "gray"
        case .green:
            return "green"
        case .orange:
            return "orange"
        case .pink:
            return "pink"
        case .primary:
            return "primary"
        case .purple:
            return "purple"
        case .red:
            return "red"
        case .secondary:
            return "secondary"
        case .yellow:
            return "yellow"
        default:
            let uicolor = UIColor(self)
            if let colorCode = uicolor.toHexCode() {
                return colorCode
            } else {
                return "systemBackgroudColor"
            }
           
        }
    }
    
    
    
}

extension TextAlignment{
    func rawValue() -> String {
        switch self {
        case .leading:
            return "leading"
        case .center:
            return "center"
        case .trailing:
            return "trailing"
        }
    }
}

extension [String : Any] {
    func getString(_ key : String,_ defaultValue : String? = nil) -> String? {
        return self[key] as? String ?? defaultValue
    }
    
    func getCGFloat(_ key : String,_ defaultValue : CGFloat = 0) -> CGFloat {
        return self[key] as? CGFloat ?? defaultValue
    }
    
    func getBool(_ key : String,_ defaultValue : Bool = false) -> Bool {
        return self[key] as? Bool ?? defaultValue
    }
    
    
    //MARK: - BlogContent
    func getBlogContent(_ key : String) -> [BlogCantent] {
        
        guard let contentDictArray = self[key] as?  [[String : Any]] else {
            return []
        }
        
        var blogContent : [BlogCantent] = []
        
        for contentDict in contentDictArray {
            if let type = contentDict["type"] as? String{
                switch type {
                case "title" :
                    if let value = contentDict.getString("value"),
                       let config = contentDict.getTitleTextConfig("config"){
                        blogContent.append(.init(ContentType: .title(value: value,config: config)))
                    }
                case "headline":
                    if let value = contentDict.getString("value"),
                       let config = contentDict.getHeadlineTextConfig("config"){
                        blogContent.append(.init(ContentType: .headline(value: value,config: config)))
                    }
                case "subheadline":
                    if let value = contentDict.getString("value"),
                       let config = contentDict.getSubheadlineTextConfig("config"){
                        blogContent.append(.init(ContentType: .subheadline(value: value,config: config)))
                    }
                case "caption":
                    if let value = contentDict.getString("value"),
                       let config = contentDict.getCaptionTextConfig("config"){
                        blogContent.append(.init(ContentType: .caption(value: value,config: config)))
                    }
                    
                case "caption2":
                    if let value = contentDict.getString("value"),
                       let config = contentDict.getCaption2TextConfig("config"){
                        blogContent.append(.init(ContentType: .caption2(value: value,config: config)))
                    }
                    
                case "customText":
                    if let value = contentDict.getString("value"),
                       let config = contentDict.getCustomTextConfig("config"){
                        blogContent.append(.init(ContentType: .customText(value: value,config: config)))
                    }
                    
                case "image":
                    if let value = contentDict.getImageProvider("value"),
                       let config = contentDict.getImageConfig("config"){
                        blogContent.append(.init(ContentType: .image(image: value,config: config)))
                    }
                    
                case "bullet":
                    if let value = contentDict.getString("value"),
                       let config = contentDict.getBulletConfig("config"){
                        blogContent.append(.init(ContentType: .bullet(value: value,config: config)))
                    }
                    
                case "divider":
                    blogContent.append(.init(ContentType: .divider))
                case "codeView":
                    if let value = contentDict.getString("value") {
                        blogContent.append(.init(ContentType: .codeView(value: value)))
                    }
                case "link":
                    if let text = contentDict.getString("text"),
                       let url = contentDict.getString("url"){
                        blogContent.append(.init(ContentType: .link(text: text, url: url)))
                    }
                case "EmptyView":
                    blogContent.append(.init(ContentType: .EmptyView))
                case "spacer":
                     let height = contentDict.getCGFloat("text",5.0)
                      blogContent.append(.init(ContentType: .spacer(height: height)))
                    
                case "linkPreview":
                    let viewType = contentDict.getLinkPreviewType("viewType")
                    if let url = contentDict.getString("url"){
                        blogContent.append(.init(ContentType: .linkPreview(type: viewType,url: url)))
                    }
               default:
                    print(type)
                    break
                }
            }
           
        }
        
        return blogContent
    }
    
   
    func getTitleTextConfig(_ key : String) -> TitleTextConfig? {
        guard let TTC_Dict = self[key] as? [String : Any] else { return nil }
        return TitleTextConfig(TTC_Dict)
    }
    
    func getHeadlineTextConfig(_ key : String) -> HeadlineTextConfig? {
        guard let HTC_Dict = self[key] as? [String : Any] else { return nil }
        return HeadlineTextConfig(HTC_Dict)
    }
    
    func getSubheadlineTextConfig(_ key : String) -> SubheadlineTextConfig? {
        guard let SHTC_Dict = self[key] as? [String : Any] else { return nil }
        return SubheadlineTextConfig(SHTC_Dict)
    }
    
    func getCaptionTextConfig(_ key : String) -> captionTextConfig? {
        guard let CTC_Dict = self[key] as? [String : Any] else { return nil }
        return captionTextConfig(CTC_Dict)
    }
    
    func getCaption2TextConfig(_ key : String) -> caption2TextConfig? {
        guard let C2TC_Dict = self[key] as? [String : Any] else { return nil }
        return caption2TextConfig(C2TC_Dict)
    }
    
    func getCustomTextConfig(_ key : String) -> CustomTextConfig? {
        guard let CuTC_Dict = self[key] as? [String : Any] else { return nil }
        return CustomTextConfig(CuTC_Dict)
    }
    
    func getImageConfig(_ key : String) -> ImageConfig? {
        guard let IC_Dict = self[key] as? [String : Any] else { return nil }
        return ImageConfig(IC_Dict)
    }
    
    func getBulletConfig(_ key : String) -> BulletPointConfig? {
        guard let BP_Dict = self[key] as? [String : Any] else { return nil }
        return BulletPointConfig(BP_Dict)
    }
    
    func getLinkPreviewType(_ key : String) -> LinkPreviewType {
        if let value = self[key] as? String {
            switch value {
            case "small":
                return .small
            case "large":
                return .large
            case "auto":
                return .auto
            default:
                return .auto
            }
        } else {
            return .auto
        }
       
    }
    
    //MARK: - Bullet Point
    func getBulletPointType() -> BulletPointType {
        guard let bulletType = self["bulletType"] as? [String : Any] else {
            return .systemImage(name: "circle.fill")
        }
        
        guard let type = bulletType["type"] as? String else {
            return .systemImage(name: "circle.fill")
        }
        
        var color : colorProvider?
        if let colorproviderDict = bulletType["color"] as? [String : Any] {
            color = bulletType.getColor("color")
        }
        
        switch type {
        case "systemImage" :
            guard let systemImageName = bulletType["name"] as? String else {
                return .systemImage(name: "circle.fill")
            }
            
            return .systemImage(name: systemImageName,color: color)
            
        case "Text":
            guard let textValue = bulletType["value"] as? String else {
                return .systemImage(name: "circle.fill")
            }
            
            let isContinueLine = bulletType.getBool("isContinueLine",false)
            
            return .Text(value: textValue,color: color,isContinueLine: isContinueLine)
            
        default:
            return .systemImage(name: "circle.fill")
        }

    }
    
    //MARK: - Image
    func getImageProvider(_ key : String) -> imageProvider? {
        guard let imageProviderDict = self[key] as? [String : Any] else {
            return nil
        }
        
        guard let providerType = imageProviderDict["providerType"] as? String else {
            return nil
        }
        
        switch providerType {
        case "uiImage" :
            if let name = imageProviderDict["value"] as? String {
                return .uiimage(name: name)
            }
        case "url":
            if let url = imageProviderDict["value"] as? String {
                return .url(url: url)
            }
        default :
            return nil
        }
        
        return nil
        
    }
    
    func getImageSource(_ key : String) -> imageSource? {
        guard let text = self["text"] as? String else {
            return nil
        }
            
        let url = self["url"] as? String ?? ""
        return imageSource(text: text,url: url)
    }
    
    //MARK: - get Aspect Mode
    func getAspectMode(_ key : String,_ defaultValue : ContentMode = .fit) -> ContentMode {
        guard let value = self[key] as? String else {
            return defaultValue
        }
        
        switch value {
        case "fit":
            return .fit
        case "fill":
            return .fill
        default:
            return defaultValue
        }
    }
    
    //MARK: - get font
    func getFontWeight(_ key : String,_ defaultValue : Font.Weight = .regular) -> Font.Weight {
        guard let  value = self[key] as? String else {
            return defaultValue
        }
        switch value {
        case "black":
            return .black
        case "bold":
            return .bold
        case "heavy":
            return .heavy
        case "light":
            return .light
        case "medium":
            return .medium
        case "regular":
            return .regular
        case "semibold":
            return .semibold
        case "thin":
            return .thin
        case "ultraLight":
            return .ultraLight
        default :
            return defaultValue
        }
    }
    
    //MARK: - Color provider
    func getColor(_ key : String,_ defaultValue : colorProvider = .color(.systemTextColor)) -> colorProvider {
        guard let  colorDict = self[key] as? [String : Any] else {
            return defaultValue
        }
        return self.geColorCase(colorDict)
        
    }
    
    func geColorCase(_ dict : [String : Any],defaultValue : colorProvider = .color(.systemTextColor)) -> colorProvider {
        guard let providerType = dict["providerType"] as? String else {
            return defaultValue
        }
        
        let alpha = dict["alpha"] as? Double ?? 1
 
        switch providerType {
        case "defaultColor":
            return .defaultColor(alpha)
        case "color" :
            guard let colorName = dict["value"] as? String else {
                return defaultValue
            }
            
            if let color = self.getColorCase_Color(colorName) {
                return colorProvider.color(color,alpha)
            } else {
                //pratent it's hexcode
                let color = Color(hex: colorName)
                return colorProvider.color(color,alpha)
            }
        case "uicolor" :
            guard let colorName = dict["value"] as? String else {
                return defaultValue
            }
            
            let uicolor = self.getColorCase_UiColor(colorName)
            return colorProvider.uicolor(uicolor,alpha)
            
        case "name":
            guard let colorName = dict["value"] as? String else {
                return defaultValue
            }
            
            return colorProvider.name(colorName,alpha)
            
        case "hexCode":
            guard let code = dict["value"] as? String else {
                return defaultValue
            }
            
            return colorProvider.hex(code,alpha)
           
        default:
            return defaultValue
        }
    }
    
    func getColorCase_Color(_ value : String) -> Color? {
        switch value {
            case "systemBackgroudColor":
                return .systemBackgroudColor
            case "systemTextColor":
                return .systemTextColor
            case "accentColor":
                return .accentColor
            case "black":
                return .black
            case "white":
                return .white
            case "blue":
                return .blue
            case "clear":
                return .clear
            case "gray":
                return .gray
            case "green":
                return .green
            case "orange":
                return .orange
            case "pink":
                return .pink
            case "primary":
                return .primary
            case "purple":
                return .purple
            case "red":
                return .red
            case "secondary":
                return .secondary
            case "yellow":
                return .yellow
            default:
              return nil
            }
    }
    
    func getColorCase_UiColor(_ value : String) -> UIColor {
        switch value {
        case "Red":
            return .red
        case "Orange":
            return .orange
        case "Yellow":
            return .yellow
        case "Green":
            return .green
        case "Blue":
            return .blue
        case "Purple":
            return .purple
        case "Brown":
            return .brown
        case "Cyan":
            return .cyan
        case "Magenta":
            return .magenta
        case "Gray":
            return .gray
        case "White":
            return .white
        case "Black":
            return .black
        case "Clear":
            return .clear
        default:
            return UIColor(Color(hex: value))
        }
    }
    
    //MARK: - font Alignment
    func getFontAlignment(_ key : String,_ defaultValue : TextAlignment = .leading) -> TextAlignment {
        guard let alignmentValue = self[key] as? String else {
            return defaultValue
        }
        
        return getTextAlignment(alignmentValue) ?? defaultValue
    }
    
    func getTextAlignment(_ value: String) -> TextAlignment? {
        switch value {
        case "leading":
            return .leading
        case "center":
            return .center
        case "trailing":
            return .trailing
        default:
            return nil
        }
    }
}
