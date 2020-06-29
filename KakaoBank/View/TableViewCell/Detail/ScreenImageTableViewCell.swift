//
//  ScreenImageTableViewCell.swift
//  KakaoBank
//
//  Created by Yong Seok Kim on 2020/06/29.
//  Copyright © 2020 Yong Seok Kim. All rights reserved.
//

import UIKit

class ScreenImagesTableViewCell: UITableViewCell, Reusable {
    public static var identifier: String = "ScreenImages"
    public var indexPath: IndexPath?
    
    private let imageWidth = (UIScreen.width - 20)/2
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.isScrollEnabled = true
        scrollView.alwaysBounceHorizontal = true
        scrollView.alwaysBounceVertical = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(self.scrollView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setup(urls: [String]) {
        
        for i in 0..<urls.count {
            let imageView: UIImageView = UIImageView()
            
            let xCoordinate: CGFloat = (10.0 * CGFloat(i + 1)) + (CGFloat(i) * imageWidth)
            imageView.frame = CGRect(x: xCoordinate, y: 0, width: (UIScreen.width - 20)/2, height: UIScreen.width * 1.1)
            imageView.roundCorners(.allCorners, radius: 10.0)
            self.scrollView.addSubview(imageView)
            
            if let imageUrl = URL(string: urls[i]) {
                imageView.downloadImageFrom(url: imageUrl, imageMode: .scaleToFill)
            }

        }
        
        self.scrollView.contentSize = CGSize(width: (imageWidth + 10.0) * CGFloat(urls.count) + 10.0, height: UIScreen.width * 1.1)
        
        self.setAutoLayOut()
    }
}

extension ScreenImagesTableViewCell {
    private func setAutoLayOut() {
        self.scrollView.snp.makeConstraints { view -> Void in
            view.left.right.top.bottom.equalTo(self)
            view.height.equalTo(UIScreen.width * 1.1)
        }
    }
}

extension ScreenImagesTableViewCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    }
}

