//
//  NewInfoTableViewCell.swift
//  KakaoBank
//
//  Created by Yong Seok Kim on 2020/06/29.
//  Copyright © 2020 Yong Seok Kim. All rights reserved.
//

import UIKit

class NewInfoTableViewCell: UITableViewCell, Reusable {
    public static var identifier: String = "NewInfo"
    
    let title: Label = Label(style: .bigTitle, text: "새로운 기능")
    lazy var versionButton: UIButton = {
        let button = UIButton()
        button.setTitle("버전 기록", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -40);
        
        button.titleLabel?.font = Fonts.title
        return button
    }()

    let versionLabel: Label = Label(style: .lightSubTitle)
    let newInfo: Label = Label(style: .body)
    let more: Label = Label(style: .lightSubTitle, colorStyle: .blue)


    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(self.title)
        self.addSubview(self.versionButton)
        self.addSubview(self.versionLabel)
        self.addSubview(self.newInfo)
        self.addSubview(self.more)
        self.more.text = "더보기"
        self.more.backgroundColor = UIColor.colorRGBA(255, 255, 255, 0.9)
        self.more.textAlignment = .right
        self.newInfo.numberOfLines = 0
        self.selectionStyle = .none
        self.setAutoLayOut()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension NewInfoTableViewCell {
    private func setAutoLayOut() {
        self.title.snp.makeConstraints { view -> Void in
            view.left.equalTo(self.snp.left).offset(10.0)
            view.top.equalTo(self.snp.top).offset(8.0)
            view.width.equalTo(100.0)
            view.height.equalTo(23.0)
        }

        self.versionButton.snp.makeConstraints { view -> Void in
            view.right.equalTo(self.snp.right).offset(-10.0)
            view.top.equalTo(self.snp.top).offset(10.0)
            view.width.equalTo(100.0)
            view.height.equalTo(18.0)

        }
        self.versionLabel.snp.makeConstraints { view -> Void in
            view.left.equalTo(self.snp.left).offset(10.0)
            view.top.equalTo(self.title.snp.bottom).offset(15.0)
            view.width.equalTo(150.0)
            view.height.equalTo(13.0)
            
        }
                
        self.more.snp.makeConstraints { view -> Void in
            view.right.equalTo(self.versionButton.snp.right)
            view.width.equalTo(60.0)
            view.height.equalTo(13.0)
            view.bottom.equalTo(self.snp.bottom).offset(-10.0)
        }
        
    }
    
    public func setup(dic: SearchResultModel, show: Bool) {
        
        self.more.isHidden = show == true ? true : false
        self.versionLabel.text = "버젼 \(dic.version)"
        self.newInfo.text = dic.releaseNotes

        let lineCount = self.newInfo.calculateMaxLines()
        self.newInfo.snp.makeConstraints { view -> Void in
            view.left.equalTo(self.snp.left).offset(10.0)
            view.right.equalTo(self.snp.right).offset(-10.0)
            view.top.equalTo(self.versionLabel.snp.top).offset(15.0)
            if show {
                view.height.equalTo(lineCount * Int(18.0))
            } else {
                view.height.equalTo(50.0)
            }
            view.bottom.equalTo(self.snp.bottom).offset(-10.0)
        }

    }
    
    public func updateAutoLayout() {
        let lineCount = self.newInfo.calculateMaxLines()
        self.newInfo.snp.updateConstraints { view -> Void in
            view.height.equalTo(lineCount * Int(18.0))
        }

        self.more.isHidden = true
        self.setNeedsLayout()
        self.layoutIfNeeded()


    }
    
    
}

