//
//  SearchMainWorker.swift
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

class SearchMainWorker {
    func getList(model: SearchMain.Search.Request,
                 completion: @escaping (Bool, SearchMain.Search.Response?) -> Void) {
        
        NetworkManager.shared.getSearchAppStoreList(model: model) { model, error in
            if let _ = error {
                completion(false, nil)
            } else {
                if let m = model {
                    let model = SearchMain.Search.Response(resultCount: m.resultCount, results: m.results)
                    completion(true, model)

                }
            }
        }
    }
}
