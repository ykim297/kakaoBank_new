//
//  Fonts.swift
//  KakaoBank
//
//  Created by Yong Seok Kim on 2020/06/27.
//  Copyright © 2020 Yong Seok Kim. All rights reserved.
//

import UIKit

#if os(OSX)
    import AppKit.NSFont
#elseif os(iOS) || os(tvOS) || os(watchOS)
    import UIKit.UIFont
#endif

class Fonts {
    public static var title = UIFont.title
    public static var subTitle = UIFont.subTitle
    public static var button = UIFont.button
    public static var bigTitle = UIFont.bigTitle
    
    public static var navigationTitle = UIFont.navigationTitle
    
    
    public static var boldTitle = UIFont.boldTitle
    
    public static var lightSubTitle = UIFont.lightSubTitle
    public static var price = UIFont.price
    public static var body = UIFont.body
    public static var folder = UIFont.folder
    public static var won = UIFont.won
}
