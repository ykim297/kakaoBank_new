//
//  TextStyle.swift
//  KakaoBank
//
//  Created by Yong Seok Kim on 2020/06/27.
//  Copyright © 2020 Yong Seok Kim. All rights reserved.
//

#if os(OSX)
    import AppKit.NSFont
#elseif os(iOS) || os(tvOS) || os(watchOS)
    import UIKit.UIFont
#endif

enum TextStyle: Int {
    case navigationTitle
    case bigTitle
    case title
    case boldTitle
    case subTitle
    case lightSubTitle
    case price
    case body
    case folder
    
    public var font: UIFont {
        switch self {
        case .title:
            return Fonts.title
        case .subTitle:
            return Fonts.subTitle
        case .bigTitle:
            return Fonts.bigTitle
        case .lightSubTitle:
            return Fonts.lightSubTitle

        case .navigationTitle:
            return Fonts.navigationTitle
        case .boldTitle:
            return Fonts.boldTitle
        case .price:
            return Fonts.price
        case .body:
            return Fonts.body
        case .folder:
            return Fonts.folder
        }
    }
    
    public var color: UIColor {
        switch self {
        case .subTitle:
            return .gray
        default:
            return .black
        }
    }
    
    public var attributes: [NSAttributedString.Key: Any] {
        var lineHeight: CGFloat = 0.0
        var color = UIColor.black
        
        switch self {
            
            case .title:
                lineHeight = 18.0
                color = .black
            case .subTitle:
                lineHeight = 15.0
                color = .gray
            case .bigTitle:
                lineHeight = 40.0
                color = .black



        case .navigationTitle:
            lineHeight = 45.0
            color = .black
        case .boldTitle:
            lineHeight = 20.0
            color = .black
        case .lightSubTitle:
            lineHeight = 13.0
            color = .black
        case .price:
            lineHeight = 36.0
            color = .black
        case .body:
            lineHeight = 18.0
            color = .black
        case .folder:
            lineHeight = 16.0
            color = .black
        }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = lineHeight
        return [ .font: font,
                 .paragraphStyle: paragraphStyle,
                 .foregroundColor: color]
    }
}

