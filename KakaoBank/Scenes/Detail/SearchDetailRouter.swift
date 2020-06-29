//
//  SearchDetailRouter.swift
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

@objc protocol SearchDetailRoutingLogic {
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol SearchDetailDataPassing {
  var dataStore: SearchDetailDataStore? { get }
}

class SearchDetailRouter: NSObject, SearchDetailRoutingLogic, SearchDetailDataPassing {
  weak var viewController: SearchDetailViewController?
  var dataStore: SearchDetailDataStore?
  
  // MARK: Routing
  
}
