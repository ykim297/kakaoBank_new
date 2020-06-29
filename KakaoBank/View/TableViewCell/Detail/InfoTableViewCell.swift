//
//  InfoTableViewCell.swift
//  KakaoBank
//
//  Created by Yong Seok Kim on 2020/06/29.
//  Copyright © 2020 Yong Seok Kim. All rights reserved.
//

import UIKit
class InfoTableViewCell: UITableViewCell, Reusable {
    public static var identifier: String = "Info"
    
    let title: Label = Label(style: .bigTitle, text: "정보")

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(self.title)
        self.selectionStyle = .none
        self.setAutoLayOut()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension InfoTableViewCell {
    private func setAutoLayOut() {
        
        self.title.snp.makeConstraints { view -> Void in
            view.top.equalTo(self.snp.top)
            view.left.equalTo(self.snp.left).offset(10.0)
            view.right.equalTo(self.snp.right).offset(-10.0)
            view.height.equalTo(40.0)
            view.bottom.equalTo(self.snp.bottom)
        }
    }
        
}

