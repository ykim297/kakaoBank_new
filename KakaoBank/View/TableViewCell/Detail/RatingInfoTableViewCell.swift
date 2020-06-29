//
//  RatingInfoTableViewCell.swift
//  KakaoBank
//
//  Created by Yong Seok Kim on 2020/06/29.
//  Copyright © 2020 Yong Seok Kim. All rights reserved.
//

import UIKit
import Cosmos

class RatingInfoTableViewCell: UITableViewCell, Reusable {
    public static var identifier: String = "RatingInfo"
    
    let rating: Label = Label(style: .bigTitle, colorStyle: .gray)
    let ratingCount: Label = Label(style: .lightSubTitle)
    
    let stage: Label = Label(style: .bigTitle, colorStyle: .gray)
    let stageName: Label = Label(style: .lightSubTitle)

    let age: Label = Label(style: .bigTitle, colorStyle: .gray)
    let ageName: Label = Label(style: .lightSubTitle)

    lazy var cosmosView: CosmosView = {
        let view = CosmosView()
        view.settings.totalStars = 5
        view.settings.starSize = 20.0
        view.settings.starMargin = 5.0
        view.settings.emptyColor = UIColor.colorRGB(230, 230, 230)
        view.settings.filledColor = .gray
        view.settings.filledBorderColor = .clear
        view.settings.emptyBorderColor = .gray
        view.settings.updateOnTouch = false
        return view
    }()
    
    let bottomLine: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(self.rating)
        self.addSubview(self.ratingCount)
        self.addSubview(self.stage)
        self.addSubview(self.stageName)
        self.addSubview(self.age)
        self.age.textAlignment = .right
        self.addSubview(self.ageName)
        self.ageName.textAlignment = .right
        self.addSubview(self.cosmosView)
        self.addSubview(self.bottomLine)
        self.selectionStyle = .none
        self.setAutoLayOut()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension RatingInfoTableViewCell {
    private func setAutoLayOut() {
        self.rating.snp.makeConstraints { view -> Void in
            view.left.equalTo(self.snp.left).offset(10.0)
            view.top.equalTo(self.snp.top).offset(10.0)
            view.width.equalTo(23.0)
            view.height.equalTo(23.0)
        }

        self.cosmosView.snp.makeConstraints { view -> Void in
            view.left.equalTo(self.rating.snp.right).offset(2.0)
            view.top.equalTo(self.snp.top).offset(12.0)
            view.width.equalTo(120.0)
            view.height.equalTo(23.0)

        }
        self.ratingCount.snp.makeConstraints { view -> Void in
            view.left.equalTo(self.snp.left).offset(10.0)
            view.top.equalTo(self.rating.snp.bottom).offset(3.0)
            view.width.equalTo(150.0)
            view.height.equalTo(13.0)
            view.bottom.equalTo(self.snp.bottom).offset(-10.0)
        }
        self.stage.snp.makeConstraints { view -> Void in
            view.left.equalTo(self.cosmosView.snp.right).offset(30.0)
            view.top.equalTo(self.snp.top).offset(10.0)
            view.width.equalTo(50.0)
            view.height.equalTo(23.0)
            
        }
        self.stageName.snp.makeConstraints { view -> Void in
            view.left.equalTo(self.stage.snp.left)
            view.top.equalTo(self.stage.snp.bottom).offset(3.0)
            view.width.equalTo(60.0)
            view.height.equalTo(13.0)
            view.bottom.equalTo(self.snp.bottom).offset(-10.0)
        }
        
        self.age.snp.makeConstraints { view -> Void in
            view.right.equalTo(self.snp.right).offset(-10.0)
            view.top.equalTo(self.snp.top).offset(10.0)
            view.width.equalTo(50.0)
            view.height.equalTo(23.0)
        }
        self.ageName.snp.makeConstraints { view -> Void in
            view.right.equalTo(self.snp.right).offset(-10.0)
            view.top.equalTo(self.age.snp.bottom).offset(10.0)
            view.width.equalTo(30.0)
            view.height.equalTo(13.0)
            view.bottom.equalTo(self.snp.bottom).offset(-10.0)
        }
        
        self.bottomLine.snp.makeConstraints { view -> Void in
            view.left.equalTo(self.snp.left).offset(10.0)
            view.right.equalTo(self.snp.left).offset(-10.0)
            view.height.equalTo(1.0)
            view.bottom.equalTo(self.snp.bottom).offset(-1.0)
        }

    }
    
    public func setup(dic: SearchResultModel) {
        
        self.rating.text = "\( Int(round(dic.averageUserRatingForCurrentVersion)))"
        self.cosmosView.rating = dic.averageUserRatingForCurrentVersion
        if dic.userRatingCount != 0 {
            self.ratingCount.isHidden = false
            if dic.userRatingCount > 1000 {
                if dic.userRatingCount > 10000 {
                    if dic.userRatingCount.digits[1] > 0 {
                        self.ratingCount.text = "\(dic.userRatingCount.digits[0]).\(dic.userRatingCount.digits[1])만개의 평가"
                    } else {
                        self.ratingCount.text = "\(dic.userRatingCount.digits[0])만개의 평가"
                    }
                } else {
                    if dic.userRatingCount.digits[1] > 0 {
                        self.ratingCount.text = "\(dic.userRatingCount.digits[0]).\(dic.userRatingCount.digits[1])천개의 평가"
                    } else {
                        self.ratingCount.text = "\(dic.userRatingCount.digits[0])천개의 평가"                           }
                }
            } else {
                self.ratingCount.text = "\(dic.userRatingCount)개의 평가"
            }
        } else {
            self.ratingCount.isHidden = false
        }
        self.stage.text = "#1"
        self.stageName.text = dic.genres[0]
        self.age.text = dic.contentAdvisoryRating
        self.ageName.text = "연령"
    }
    
    
}

