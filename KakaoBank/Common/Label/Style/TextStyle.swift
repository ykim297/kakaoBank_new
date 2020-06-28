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
        case .navigationTitle:
            return Fonts.navigationTitle
        case .bigTitle:
            return Fonts.bigTitle
        case .title:
            return Fonts.title
        case .boldTitle:
            return Fonts.boldTitle
        case .subTitle:
            return Fonts.subTitle
        case .lightSubTitle:
            return Fonts.lightSubTitle
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
        case .navigationTitle:
            lineHeight = 45.0
            color = .black
        case .bigTitle:
            lineHeight = 33.0
            color = .black
        case .title:
            lineHeight = 16.0
            color = .black
        case .boldTitle:
            lineHeight = 20.0
            color = .black
        case .subTitle:
            lineHeight = 16.0
            color = .gray
        case .lightSubTitle:
            lineHeight = 18.0
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

