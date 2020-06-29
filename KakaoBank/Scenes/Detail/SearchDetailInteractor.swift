//
//  SearchDetailInteractor.swift
//  KakaoBank
//
//  Created by Yong Seok Kim on 2020/06/29.
//  Copyright (c) 2020 Yong Seok Kim. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol SearchDetailBusinessLogic {
    func request(request: SearchDetail.Model.Request)
}

protocol SearchDetailDataStore {
    var selectedSearchData: SearchResultModel? { get set }
}

class SearchDetailInteractor: SearchDetailBusinessLogic, SearchDetailDataStore {
    var presenter: SearchDetailPresentationLogic?
    var worker: SearchDetailWorker?
    var selectedSearchData: SearchResultModel?
    
    // MARK: Do something
    
    func request(request: SearchDetail.Model.Request) {
        worker = SearchDetailWorker()
        worker?.requestData()
        
        let response = SearchDetail.Model.Response()
        presenter?.present(response: response)
    }
}
