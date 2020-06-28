//
//  String+.swift
//  KakaoBank
//
//  Created by Yong Seok Kim on 2020/06/27.
//  Copyright © 2020 Yong Seok Kim. All rights reserved.
//

import UIKit

extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
    
    func extractClassName() -> String {
        guard let fileName = components(separatedBy: "/").last,
            let className = fileName.components(separatedBy: ".").first else {
            return "No FilePath"
        }

        return className
    }
    
    func changeStyle(style: TextStyle) -> NSAttributedString {
        return NSAttributedString(string: self,
                                  attributes: style.attributes)
    }
    
    func stringSize(fontSize: CGFloat, height: CGFloat) -> CGFloat{
        let font = UIFont.systemFont(ofSize: fontSize)
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 999.0, height: height))
        label.font = font
        label.text = self
        
        label.sizeToFit()
        return label.frame.size.width
    }
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }

}
