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
        //TODO:로그인 되어 있으면 앱 메인페이지로.. 현재는 회원가입 페이지로 가있음
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        DispatchQueue.main.async {
            let registerStoryboard = UIStoryboard(name: "Search", bundle: nil)
            let viewController = registerStoryboard.instantiateViewController(withIdentifier: "SerachMainViewController")
            let navigationController = BaseNavigationController(rootViewController: viewController)            
            navigationController.navigationBar.isTranslucent = false
            self.window?.rootViewController = navigationController
            self.window?.makeKeyAndVisible()
        }
    }

}
