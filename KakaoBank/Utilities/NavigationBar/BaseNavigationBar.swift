//
//  BaseNavigationBar.swift
//  KakaoBank
//
//  Created by Yong Seok Kim on 2020/06/28.
//  Copyright © 2020 Yong Seok Kim. All rights reserved.
//

import UIKit

class BaseNavigationBar: UINavigationBar {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setValue(true, forKey: "hidesShadow")
        
        let backImage = UIImage(named: "btnGnbBackB")
        let renderedImage = backImage?.withRenderingMode(.alwaysOriginal)

        self.backIndicatorImage = renderedImage
        self.backIndicatorTransitionMaskImage = renderedImage

        let barAppearace = UIBarButtonItem.appearance()
        barAppearace.setBackButtonTitlePositionAdjustment(UIOffset(horizontal: 0, vertical: -60), for:UIBarMetrics.default)

    }

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setValue(true, forKey: "hidesShadow")
        
        let backImage = UIImage(named: "btnGnbBackB")
        let renderedImage = backImage?.withRenderingMode(.alwaysOriginal)
        
        self.backIndicatorImage = renderedImage
        self.backIndicatorTransitionMaskImage = renderedImage
        
        self.barTintColor = UIColor.white

        let barAppearace = UIBarButtonItem.appearance()
        barAppearace.setBackButtonTitlePositionAdjustment(UIOffset(horizontal: 0, vertical: -60), for:UIBarMetrics.default)

    }

    // MARK: Overrides
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
