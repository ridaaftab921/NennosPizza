//
//  UIFont+Extension.swift
//  NennosPizza
//
//  Created by Rida Aftab on 22/11/2023.
//

import UIKit

public extension UIFont {
    
    class func regular(size: CGFloat) -> UIFont? {
        return UIFont.init(name: "SFUIText-Regular", size: size)
    }
    
    class func bold(size: CGFloat) -> UIFont? {
        return UIFont.init(name: "SFUIText-Bold", size: size)
    }
    class func heavy(size: CGFloat) -> UIFont? {
        return UIFont.init(name: "SFUIText-Heavy", size: size)
    }
}
