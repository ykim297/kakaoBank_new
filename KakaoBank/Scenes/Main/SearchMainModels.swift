//
//  SearchMainModels.swift
//  KakaoBank
//
//  Created by Yong Seok Kim on 2020/06/28.
//  Copyright (c) 2020 Yong Seok Kim. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum SearchMain {
    // MARK: Use cases
        enum Search {
            struct Request{
                let term: String
                let country: String
                let media: String
            }
            struct Response: Codable {
                let resultCount: Int
                let results: [SearchResultModel]
            }
            struct ViewModel {
                let lists: [SearchResultModel]    
            }
        }
}
