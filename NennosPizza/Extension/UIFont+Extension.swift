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

extension UIColor {
    static var customGray: UIColor {
        return #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
    }
    
    static var customThemeRed: UIColor {
        return #colorLiteral(red: 0.8823529412, green: 0.3019607843, blue: 0.2705882353, alpha: 1)
    }
    
}
