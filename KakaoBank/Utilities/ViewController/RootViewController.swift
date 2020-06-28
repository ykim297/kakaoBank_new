//
//  RootViewController.swift
//  KakaoBank
//
//  Created by Yong Seok Kim on 2020/06/27.
//  Copyright © 2020 Yong Seok Kim. All rights reserved.
//

// base RootViewController

import UIKit

class RootViewController: UIViewController {
    private var current: UIViewController?
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        searchView()
    }
    
    private func loadingIndicator() {
        
    }
    
    private func closeIndicator() {
        
    }
    
    private func searchView() {
//        let result = UINavigationController(rootViewController: SearchViewController())
//        result.view.backgroundColor = .white
//        addChild(result)
//        result.view.frame = view.bounds
//        view.addSubview(result.view)
//        result.didMove(toParent: self)
//        current = result
    }
}
