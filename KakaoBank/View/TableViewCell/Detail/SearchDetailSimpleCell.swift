//
//  SearchDetailSimpleCell.swift
//  KakaoBank
//
//  Created by Yong Seok Kim on 2020/06/29.
//  Copyright © 2020 Yong Seok Kim. All rights reserved.
//

import UIKit

class SearchDetailSimpleCell: UITableViewCell, Reusable {
    public static var identifier: String = "SearchDetailSimple"
    
    private let cellWidth = (UIScreen.width - 20)/2
    
    let leftTitle: Label = Label(style: .body)
    let rightInfo: Label = Label(style: .subTitle, colorStyle: .gray)
    let lineView: UIView = UIView()
    
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(self.leftTitle)
        self.addSubview(self.rightInfo)
        self.addSubview(self.lineView)
        self.lineView.backgroundColor = .lightGray
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setup(title: String, info: String) {
        self.leftTitle.text = title
        self.leftTitle.textAlignment = .left
        self.rightInfo.text = info
        self.rightInfo.textAlignment = .right
        self.rightInfo.textColor = .black

        self.setAutoLayOut()
    }
}

extension SearchDetailSimpleCell {
    private func setAutoLayOut() {
        self.leftTitle.snp.makeConstraints { view -> Void in
            view.left.equalTo(self).offset(10.0)
            view.top.equalTo(self.snp.top).offset(12.0)
            view.height.equalTo(18.0)
            view.width.equalTo(cellWidth)
        }
        self.rightInfo.snp.makeConstraints { view -> Void in
            view.right.equalTo(self).offset(-10.0)
            view.top.equalTo(self.snp.top).offset(12.0)
            view.height.equalTo(18.0)
            view.width.equalTo(cellWidth)
        }
        
        self.lineView.snp.makeConstraints { view -> Void in
            view.left.equalTo(self).offset(10.0)
            view.right.equalTo(self).offset(-10.0)
            view.top.equalTo(self.snp.top).offset(41.5)
            view.height.equalTo(0.5)
            view.bottom.equalTo(self.snp.bottom).offset(-0.5)
        }
    }
}

