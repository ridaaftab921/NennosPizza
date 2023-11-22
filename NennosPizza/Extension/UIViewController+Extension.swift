//
//  UIViewController+Extension.swift
//  NennosPizza
//
//  Created by Rida Aftab on 22/11/2023.
//

import UIKit
import SwiftMessages

extension UIViewController {
    private struct AssociatedKeys {
        static var activityIndicatorKey = "activityIndicatorKey"
    }
    
    private var activityIndicator: UIActivityIndicatorView? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.activityIndicatorKey) as? UIActivityIndicatorView
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.activityIndicatorKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func showActivityIndicatorView() {
        if activityIndicator == nil {
            let activityIndicatorView = UIActivityIndicatorView(style: .large)
            activityIndicatorView.color = .gray
            activityIndicatorView.center = view.center
            activityIndicatorView.hidesWhenStopped = true
            activityIndicatorView.startAnimating()
            view.addSubview(activityIndicatorView)
            view.bringSubviewToFront(activityIndicatorView)
            
            activityIndicator = activityIndicatorView
        }
    }
    
    func hideActivityIndicatorView() {
        activityIndicator?.stopAnimating()
        activityIndicator?.removeFromSuperview()
        activityIndicator = nil
    }
    
    func showError(buttonHandler: @escaping () -> Void) {
        
        let error = MessageView.viewFromNib(layout: .tabView)
        error.configureTheme(.error)
        error.configureContent(title: "Error", body: "Something is horribly wrong!")
        error.button?.setTitle("Try Again", for: .normal)
        error.buttonTapHandler = { sender in
            buttonHandler()
            SwiftMessages.hide(animated: true)
        }
        var errorConfig = SwiftMessages.defaultConfig
        errorConfig.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        errorConfig.duration = .forever
        
        SwiftMessages.show(config: errorConfig, view: error)
    }
}
