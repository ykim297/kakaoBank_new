//
//  DescriptionTableViewCell.swift
//  KakaoBank
//
//  Created by Yong Seok Kim on 2020/06/29.
//  Copyright © 2020 Yong Seok Kim. All rights reserved.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell, Reusable {
    public static var identifier: String = "Description"
    
    let body: Label = Label(style: .body)
    let more: Label = Label(style: .lightSubTitle, colorStyle: .blue)

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(self.body)
        self.addSubview(self.more)
        self.more.text = "더보기"
        self.more.backgroundColor = UIColor.colorRGBA(255, 255, 255, 0.9)
        self.more.textAlignment = .right
        self.body.numberOfLines = 0
        self.selectionStyle = .none
        self.setAutoLayOut()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension DescriptionTableViewCell {
    private func setAutoLayOut() {
        self.more.snp.makeConstraints { view -> Void in
            view.right.equalTo(self.snp.right).offset(-10.0)
            view.width.equalTo(60.0)
            view.height.equalTo(13.0)
            view.bottom.equalTo(self.snp.bottom).offset(-10.0)
        }
    }
    
    public func setup(dic: SearchResultModel, show: Bool) {
        
        self.more.isHidden = show == true ? true : false
        self.body.text = dic.description

        let lineCount = self.body.calculateMaxLines()
        self.body.snp.makeConstraints { view -> Void in
            view.left.equalTo(self.snp.left).offset(10.0)
            view.right.equalTo(self.snp.right).offset(-10.0)
            view.top.equalTo(self.snp.top).offset(15.0)
            if show {
                view.height.equalTo(lineCount * Int(18.0))
            } else {
                view.height.equalTo(50.0)
            }
            view.bottom.equalTo(self.snp.bottom).offset(-15.0)
        }

    }
    
    public func updateAutoLayout() {
        let lineCount = self.body.calculateMaxLines()
        self.body.snp.updateConstraints { view -> Void in
            view.height.equalTo(lineCount * Int(18.0))
        }

        self.more.isHidden = true
        self.setNeedsLayout()
        self.layoutIfNeeded()
    }
    
    
}
