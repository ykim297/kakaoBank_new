//
//  BasicInfoTableViewCell.swift
//  KakaoBank
//
//  Created by Yong Seok Kim on 2020/06/29.
//  Copyright © 2020 Yong Seok Kim. All rights reserved.
//

import UIKit

class BasicInfoTableViewCell: UITableViewCell, Reusable {
    public static var identifier: String = "BasicInfo"
    
    let title: Label = Label(style: .bigTitle)
    let subTitle: Label = Label(style: .lightSubTitle)
    let mainImageView: UIImageView = UIImageView()
    
    lazy var openButton: UIButton = {
        let button = UIButton()
        button.setTitle("열기", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = Fonts.title
        return button
    }()

    lazy var shareButton: UIButton = {
        let button = UIButton()
        button.setTitle("공유", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = Fonts.title
        return button
    }()

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(self.title)
        self.title.numberOfLines = 0
        self.addSubview(self.subTitle)
        self.addSubview(self.mainImageView)
        self.mainImageView.roundCorners(.allCorners, radius: 15.0)
        self.addSubview(self.openButton)
        self.openButton.roundCorners(.allCorners, radius: 10.0)
        self.addSubview(self.shareButton)
        self.shareButton.roundCorners(.allCorners, radius: 12.5)
        self.selectionStyle = .none
        self.setAutoLayOut()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension BasicInfoTableViewCell {
    private func setAutoLayOut() {
        self.mainImageView.snp.makeConstraints { view -> Void in
            view.left.equalTo(self.snp.left).offset(10.0)
            view.top.equalTo(self.snp.top).offset(10.0)
            view.width.equalTo(100.0)
            view.height.equalTo(100.0)
        }

        self.title.snp.makeConstraints { view -> Void in
            view.left.equalTo(self.mainImageView.snp.right).offset(10.0)
            view.right.equalTo(self.snp.right).offset(-10.0)
            view.top.equalTo(self.snp.top).offset(10.0)
            view.height.equalTo(50.0)
            
        }
        self.subTitle.snp.makeConstraints { view -> Void in
            view.left.equalTo(self.mainImageView.snp.right).offset(10.0)
            view.right.equalTo(self.snp.right).offset(-10.0)
            view.top.equalTo(self.title.snp.bottom).offset(3.0)
            view.height.equalTo(13.0)
        }
        self.openButton.snp.makeConstraints { view -> Void in
            view.left.equalTo(self.mainImageView.snp.right).offset(10.0)
            view.top.equalTo(self.subTitle.snp.bottom).offset(10.0)
            view.width.equalTo(65.0)
            view.height.equalTo(25.0)
            view.bottom.equalTo(self.snp.bottom).offset(-10.0)
        }
        self.shareButton.snp.makeConstraints { view -> Void in
            view.right.equalTo(self.snp.right).offset(-10.0)
            view.top.equalTo(self.subTitle.snp.bottom).offset(10.0)
            view.width.equalTo(25.0)
            view.height.equalTo(25.0)
            view.bottom.equalTo(self.snp.bottom).offset(-10.0)
        }
    }
    
    public func setup(dic: SearchResultModel) {
        mainImageView.downloadImageFrom(urlString: dic.artworkUrl100, imageMode: .scaleAspectFit)
        title.text = dic.trackName
        subTitle.text = dic.artistName
    }
}
