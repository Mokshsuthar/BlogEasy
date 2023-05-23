//
//  Structs.swift
//  BlogEasy
//
//  Created by Moksh on 22/05/23.
//

import Foundation
        
public struct BlogCantent : Identifiable {
    public var id = UUID()
    var ContentType : BlogCantentType
    
    public init(ContentType: BlogCantentType) {
        self.ContentType = ContentType
    }
}

public enum BlogCantentType {
    case title(value : String)
    case headline(value : String)
    case subheadline(value : String)
    case caption(value :String)
    case caption2(value : String)
    case image(image : imageProvider,source : imageSource? = nil)
    case bullet(bulletImage : UIImage,value : String)
    case TextBullet(BulletString : String, value :String)
    case divider
    case link(text: String,url: String)
    case EmptyView
    case spacer(height : CGFloat = 10)
    case transparentImage(image : UIImage)
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


