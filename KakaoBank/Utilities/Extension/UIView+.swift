//
//  UIView+.swift
//  KakaoBank
//
//  Created by Yong Seok Kim on 2020/06/27.
//  Copyright © 2020 Yong Seok Kim. All rights reserved.
//

import UIKit

extension UIView {
    
    func x() -> CGFloat {
        return self.frame.origin.x
    }

    func y() -> CGFloat {
        return self.frame.origin.y
    }

    func lastX() -> CGFloat {
        return self.frame.origin.x + self.frame.size.width
    }
    
    func lastY() -> CGFloat {
        return self.frame.origin.y + self.frame.size.height
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        clipsToBounds = true
        layer.cornerRadius = radius
        if #available(iOS 11.0, *) {
            layer.maskedCorners = CACornerMask(rawValue: corners.rawValue)
        } else {
            // Fallback on earlier versions
            let path = UIBezierPath(roundedRect: self.bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width:radius, height: radius))

            let maskLayer = CAShapeLayer()
            maskLayer.frame = self.bounds
            maskLayer.path = path.cgPath

            layer.mask = maskLayer
        }
    }
    
    func setLayerBorder(color: UIColor = .black, width: CGFloat = 0.5) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
}
