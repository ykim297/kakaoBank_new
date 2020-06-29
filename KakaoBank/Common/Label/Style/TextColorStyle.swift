//
//  TextColorStyle.swift
//  KakaoBank
//
//  Created by Yong Seok Kim on 2020/06/27.
//  Copyright © 2020 Yong Seok Kim. All rights reserved.
//

import UIKit

enum TextColorStyle: Int {
    case primary
    case gray
    case blue
    
    public var color: UIColor {
        switch self {
        case .primary:
            return .black
        case .gray:
            return .gray
        case .blue:
            return .blue            
        }
    }
}
