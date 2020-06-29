//
//  UILabel+.swift
//  KakaoBank
//
//  Created by Yong Seok Kim on 2020/06/27.
//  Copyright © 2020 Yong Seok Kim. All rights reserved.
//

import UIKit

extension UILabel {
    func setTextFont(text: String?, selectedText: String?, size: CGFloat = 20.0) {
        let attributedString = NSMutableAttributedString(string: text!)
        let range = (text! as NSString).range(of: selectedText!)
        attributedString.setAttributes([NSAttributedString.Key.font: Fonts.won], range: range)
        self.attributedText = attributedString
    }
    
    func calculateMaxLines() -> Int {
        let maxSize = CGSize(width: frame.size.width, height: CGFloat(Float.infinity))
        let charSize = font.lineHeight
        let text = (self.text ?? "") as NSString
        let textSize = text.boundingRect(
            with: maxSize,
            options: .usesLineFragmentOrigin,
            attributes: [NSAttributedString.Key.font: font as Any],
            context: nil
        )
        let linesRoundedUp = Int(ceil(textSize.height / charSize))
        return linesRoundedUp
    }
}
