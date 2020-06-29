//
//  SearchResultListModel.swift
//  KakaoBank
//
//  Created by Yong Seok Kim on 2020/06/29.
//  Copyright © 2020 Yong Seok Kim. All rights reserved.
//

import UIKit


class SearchResultListModel: Codable {
    let resultCount: Int
    let results: [SearchResultModel]
}
