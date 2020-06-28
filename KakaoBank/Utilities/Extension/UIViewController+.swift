//
//  UIViewController+.swift
//  KakaoBank
//
//  Created by Yong Seok Kim on 2020/06/28.
//  Copyright © 2020 Yong Seok Kim. All rights reserved.
//

import UIKit

extension UIViewController {
    func alert(_ title: String, message: String, handler: ((UIAlertAction) -> Void)? = nil) {
        DispatchQueue.main.async {
            let vc = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            vc.view.tintColor = .black
            vc.addAction(UIAlertAction(title: "OK", style: .cancel, handler: handler))
            self.present(vc, animated: true, completion: nil)
        }
    }
}
