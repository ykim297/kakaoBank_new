//
//  BaseViewController.swift
//  KakaoBank
//
//  Created by Yong Seok Kim on 2020/06/27.
//  Copyright © 2020 Yong Seok Kim. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    var keyboardHeight: CGFloat = 0.0

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillClose),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if isMovingFromParent {
//            NetworkManager.cancellAll()
        }
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            var keyboardHeight: CGFloat = 0.0
            if #available(iOS 11.0, *) {
                keyboardHeight = keyboardRectangle.height - view.safeAreaInsets.bottom
            } else {
                // Fallback on earlier versions
                keyboardHeight = keyboardRectangle.height
            }
            self.keyboardHeight = -keyboardHeight
            updateViewConstraints()
        }
    }

    @objc func keyboardWillClose(_ notification: Notification) {
        keyboardHeight = 0
        updateViewConstraints()
        view.endEditing(true)
    }
}

extension BaseViewController: UIGestureRecognizerDelegate {
    @objc func closeView() {
        keyboardHeight = 0.0
        updateViewConstraints()
        view.endEditing(true)
    }
}

