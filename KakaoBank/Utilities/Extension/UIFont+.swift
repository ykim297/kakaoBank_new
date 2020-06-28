//
//  UIFont+.swift
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


extension UIFont {
    
    class var navigationTitle: UIFont {
        return UIFont.systemFont(ofSize: 40.0, weight: .bold)
    }
    
    class var bigTitle: UIFont {
        return UIFont.systemFont(ofSize: 30.0, weight: .bold)
    }
    
    class var title: UIFont {
        return UIFont.systemFont(ofSize: 13.0, weight: .regular)
    }
    
    class var boldTitle: UIFont {
        return UIFont.systemFont(ofSize: 18.0, weight: .bold)
    }
    
    class var subTitle: UIFont {
        return UIFont.systemFont(ofSize: 13.0, weight: .regular)
    }
    
    class var lightSubTitle: UIFont {
        return UIFont.systemFont(ofSize: 15.0, weight: .light)
    }
    
    class var price: UIFont {
        return UIFont.systemFont(ofSize: 33.0, weight: .bold)
    }
    
    class var body: UIFont {
        return UIFont.systemFont(ofSize: 15.0, weight: .regular)
    }

    class var folder: UIFont {
        return UIFont.systemFont(ofSize: 13.0, weight: .regular)
    }

    class var won: UIFont {
        return UIFont.systemFont(ofSize: 26.0, weight: .regular)
    }
}
