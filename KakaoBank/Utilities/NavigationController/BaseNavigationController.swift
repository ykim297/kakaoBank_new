//
//  BaseNavigationController.swift
//  KakaoBank
//
//  Created by Yong Seok Kim on 2020/06/28.
//  Copyright © 2020 Yong Seok Kim. All rights reserved.
//

import UIKit


class BaseNavigationController: UINavigationController {
    
    init() {
//        super.init(navigationBarClass: BaseNavigationBar.self, toolbarClass: nil)
        super.init(navigationBarClass: UINavigationBar.self, toolbarClass: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(rootViewController: UIViewController) {
//        super.init(navigationBarClass: BaseNavigationBar.self, toolbarClass: nil)
        super.init(navigationBarClass: UINavigationBar.self, toolbarClass: nil)
        self.viewControllers = [rootViewController]
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.backgroundColor = .white
        self.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always


        // do whatever custom setup stuff you want here
    }
        
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        self.navigationBar.height(60)
    }

}
