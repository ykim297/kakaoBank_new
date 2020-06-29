//
//  SearchResultTableViewCell.swift
//  KakaoBank
//
//  Created by Yong Seok Kim on 2020/06/29.
//  Copyright © 2020 Yong Seok Kim. All rights reserved.
//

import UIKit
import Cosmos
import SnapKit

class SearchResultTableViewCell: UITableViewCell, Reusable {

    public static var identifier: String = "SearchResultTableViewCell"

    let mainImageView: UIImageView = UIImageView()
    let title: Label = Label(style: .title, colorStyle: .primary)
    let subTitle: Label = Label(style: .subTitle, colorStyle: .gray)
    let countNumberLabel: Label = Label(style: .subTitle, colorStyle: .gray)
    let firstImageView: UIImageView = UIImageView()
    let secondImageView: UIImageView = UIImageView()
    let thirdImageView: UIImageView = UIImageView()
    
    lazy var openButton: UIButton = {
        let button = UIButton()
        button.setTitle("열기", for: .normal)
        button.backgroundColor = UIColor.lightGray
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = Fonts.button
        button.roundCorners(.allCorners, radius: 12.5)
        return button
    }()
    
    lazy var cosmosView: CosmosView = {
        let view = CosmosView()
        view.settings.totalStars = 5
        view.settings.starSize = 11.0
        view.settings.starMargin = 1.0
        view.settings.emptyColor = .white
        view.settings.filledColor = .gray
        view.settings.filledBorderColor = .clear
        view.settings.emptyBorderColor = .gray
        view.settings.updateOnTouch = false
        return view
    }()
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Initialization code
        self.setComponent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    private func setComponent() {
        self.addSubview(mainImageView)
        self.addSubview(title)
        self.addSubview(subTitle)
        self.addSubview(cosmosView)
        self.addSubview(countNumberLabel)
        self.addSubview(openButton)
        
        self.addSubview(firstImageView)
        self.addSubview(secondImageView)
        self.addSubview(thirdImageView)
        
        mainImageView.roundCorners(.allCorners, radius: 5)
        firstImageView.roundCorners(.allCorners, radius: 5)
        secondImageView.roundCorners(.allCorners, radius: 5)
        thirdImageView.roundCorners(.allCorners, radius: 5)
        
        self.setAutoLayOut()
    }
    
    private func setAutoLayOut() {
        self.mainImageView.snp.makeConstraints { view -> Void in
            view.left.equalTo(self.snp.left).offset(10.0)
            view.top.equalTo(self.snp.top).offset(10.0)
            view.height.equalTo(45.0)
            view.width.equalTo(45.0)
        }
        self.title.snp.makeConstraints { view -> Void in
            view.top.equalTo(self.snp.top).offset(10.0)
            view.left.equalTo(self.mainImageView.snp.right).offset(5.0)
            view.right.equalTo(self.snp.right).offset(-65.0)
            view.height.equalTo(18.0)
        }
        self.subTitle.snp.makeConstraints { view -> Void in
            view.top.equalTo(self.title.snp.bottom).offset(1.0)
            view.left.equalTo(self.mainImageView.snp.right).offset(5.0)
            view.right.equalTo(self.snp.right).offset(-65.0)
            view.height.equalTo(15.0)
        }
        self.cosmosView.snp.makeConstraints { view -> Void in
            view.top.equalTo(self.subTitle.snp.bottom).offset(1.0)
            view.left.equalTo(self.mainImageView.snp.right).offset(5.0)
            view.width.equalTo(60.0)
            view.height.equalTo(15.0)
        }

        self.countNumberLabel.snp.makeConstraints { view -> Void in
            view.top.equalTo(self.subTitle.snp.bottom).offset(0.0)
            view.left.equalTo(self.cosmosView.snp.right).offset(2.0)
            view.right.equalTo(self.snp.right).offset(-65.0)
            view.height.equalTo(15.0)
        }
        
        self.openButton.snp.makeConstraints { view -> Void in
            view.top.equalTo(self.snp.top).offset(20.0)
            view.right.equalTo(self.snp.right).offset(-10.0)
            view.width.equalTo(65.0)
            view.height.equalTo(25.0)
        }
        
        let oneWidth = (UIScreen.width - (20*2) - (5*2))/3
        
        self.firstImageView.snp.makeConstraints { view -> Void in
            view.top.equalTo(self.snp.top).offset(70.0)
            view.left.equalTo(self.snp.left).offset(20.0)
            view.right.equalTo(self.secondImageView.snp.left).offset(-5.0)
            view.width.equalTo(oneWidth)
            view.height.equalTo(200.0)
            view.bottom.equalTo(self.snp.bottom).offset(-10.0)
        }
        
        self.secondImageView.snp.makeConstraints { view -> Void in
            view.top.equalTo(self.snp.top).offset(70.0)
            view.right.equalTo(self.thirdImageView.snp.left).offset(-5.0)
            view.width.equalTo(oneWidth)
            view.height.equalTo(200.0)
            view.bottom.equalTo(self.snp.bottom).offset(-10.0)
        }
        
        self.thirdImageView.snp.makeConstraints { view -> Void in
            view.top.equalTo(self.snp.top).offset(70.0)
            view.right.equalTo(self.snp.right).offset(-20.0)
            view.width.equalTo(oneWidth)
            view.height.equalTo(200.0)
            view.bottom.equalTo(self.snp.bottom).offset(-10.0)
        }
    }
}



extension SearchResultTableViewCell {
    
    func setData(dic: SearchResultModel) {
        
        mainImageView.downloadImageFrom(urlString: dic.artworkUrl60, imageMode: .scaleAspectFit)
        
        title.text = dic.trackName
        subTitle.text = dic.artistName
        self.cosmosView.rating = dic.averageUserRatingForCurrentVersion
        
        if dic.userRatingCount != 0 {
            self.contentView.isHidden = false
            if dic.userRatingCount > 1000 {
                if dic.userRatingCount > 10000 {
                    if dic.userRatingCount.digits[1] > 0 {
                        countNumberLabel.text = "\(dic.userRatingCount.digits[0]).\(dic.userRatingCount.digits[1])만"
                    } else {
                        countNumberLabel.text = "\(dic.userRatingCount.digits[0]))만"
                    }
                } else {
                    if dic.userRatingCount.digits[1] > 0 {
                        countNumberLabel.text = "\(dic.userRatingCount.digits[0]).\(dic.userRatingCount.digits[1])천"
                    } else {
                        countNumberLabel.text = "\(dic.userRatingCount.digits[0])천"
                    }
                }
            } else {
                countNumberLabel.text = "\(dic.userRatingCount)"
            }
        } else {
            self.contentView.isHidden = true
        }
        
        
        let screenshotUrls = dic.screenshotUrls
        switch screenshotUrls.count {
        case 3...:
            thirdImageView.downloadImageFrom(urlString: screenshotUrls[2], imageMode: .scaleToFill)
            secondImageView.downloadImageFrom(urlString: screenshotUrls[1], imageMode: .scaleToFill)
            firstImageView.downloadImageFrom(urlString: screenshotUrls[0], imageMode: .scaleToFill)
        case 2:
            secondImageView.downloadImageFrom(urlString: screenshotUrls[1], imageMode: .scaleToFill)
            firstImageView.downloadImageFrom(urlString: screenshotUrls[0], imageMode: .scaleToFill)
        case 1:
            firstImageView.downloadImageFrom(urlString: screenshotUrls[0], imageMode: .scaleToFill)
            break
        default:
            break
        }
            
    }
    
}


extension StringProtocol  {
    var digits: [Int] { compactMap(\.wholeNumberValue) }
}

extension LosslessStringConvertible {
    var string: String { .init(self) }
}

extension Numeric where Self: LosslessStringConvertible {
    var digits: [Int] { string.digits }
}
