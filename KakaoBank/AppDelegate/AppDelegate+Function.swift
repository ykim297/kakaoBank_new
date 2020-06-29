//
//  AppDelegate+Function.swift
//  KakaoBank
//
//  Created by Yong Seok Kim on 2020/06/28.
//  Copyright © 2020 Yong Seok Kim. All rights reserved.
//

import UIKit

extension AppDelegate {
    // set RootViewController when App is launched
    func setRootViewController() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        DispatchQueue.main.async {
            let registerStoryboard = UIStoryboard(name: "Search", bundle: nil)
            let viewController = registerStoryboard.instantiateViewController(withIdentifier: "SearchMainView")
            let navigationController = BaseNavigationController(rootViewController: viewController)            
            navigationController.navigationBar.isTranslucent = false
            self.window?.rootViewController = navigationController
        }
    }
}

extension AppDelegate {
    static var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate // swiftlint:disable:this force_cast
    }
}


