//
//  CompanyInfoTableViewCell.swift
//  KakaoBank
//
//  Created by Yong Seok Kim on 2020/06/29.
//  Copyright © 2020 Yong Seok Kim. All rights reserved.
//

import UIKit

class CompanyInfoTableViewCell: UITableViewCell, Reusable {
    public static var identifier: String = "CompanyInfo"
    
    let title: Label = Label(style: .body, colorStyle: .blue)
    let subTitle: Label = Label(style: .lightSubTitle, text: "개발자")
    let arrow: Label = Label(style: .body, text: "\u{003E}")

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(self.title)
        self.addSubview(self.subTitle)
        self.addSubview(self.arrow)
        self.selectionStyle = .none
        self.setAutoLayOut()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CompanyInfoTableViewCell {
    private func setAutoLayOut() {
        
        self.title.snp.makeConstraints { view -> Void in
            view.top.equalTo(self.snp.top).offset(10.0)
            view.left.equalTo(self.snp.left).offset(10.0)
            view.right.equalTo(self.snp.right).offset(-10.0)
            view.height.equalTo(18.0)
            
        }
        
        self.subTitle.snp.makeConstraints { view -> Void in
            view.top.equalTo(self.title.snp.bottom).offset(3.0)
            view.left.equalTo(self.snp.left).offset(10.0)
            view.right.equalTo(self.snp.right).offset(-10.0)
            view.height.equalTo(13.0)
            view.bottom.equalTo(self.snp.bottom).offset(-10.0)
        }
        
        self.arrow.snp.makeConstraints { view -> Void in
            view.right.equalTo(self.snp.right).offset(-5.0)
            view.top.equalTo(self.snp.top)
            view.width.equalTo(30.0)
            view.height.equalTo(50.0)
            
        }

    }
    
    public func setup(dic: SearchResultModel) {
        self.title.text = dic.artistName
    }
    
}

