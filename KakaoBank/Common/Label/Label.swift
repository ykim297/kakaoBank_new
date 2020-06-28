//
//  Label.swift
//  KakaoBank
//
//  Created by Yong Seok Kim on 2020/06/27.
//  Copyright © 2020 Yong Seok Kim. All rights reserved.
//

import UIKit

class Label: UILabel {
    public init(style: TextStyle = .title) {
        super.init(frame: .zero)
        self.font = style.font
        self.textColor = style.color
    }
    
    public init(style: TextStyle = .title,
                colorStyle: TextColorStyle) {
        super.init(frame: .zero)
        self.font = style.font
        self.textColor = colorStyle.color
    }
    
    public init(style: TextStyle = .title,
                text: String) {
        super.init(frame: .zero)
        self.textColor = style.color
        attributedText = NSAttributedString(string: text,
                                            attributes: style.attributes)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }             
    
}
