//
//  Color+Extension.swift
//  cardManager
//
//  Created by style强 on 2019/3/12.
//  Copyright © 2019 style强. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    class func colorWithCustom(r: CGFloat, g:CGFloat, b:CGFloat) -> UIColor {
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1)
    }
    class func randomColor() -> UIColor {
        let r = CGFloat(arc4random_uniform(256))
        let g = CGFloat(arc4random_uniform(256))
        let b = CGFloat(arc4random_uniform(256))
        return UIColor.colorWithCustom(r: r, g: g, b: b)
    }
    class func colorWithHex(hex: String, alpha: CGFloat) -> UIColor {
        var rgb: CUnsignedInt = 0;
        let scanner = Scanner(string: hex)
        if hex.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        scanner.scanHexInt32(&rgb)
        let r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((rgb & 0xFF00) >> 8) / 255.0
        let b = CGFloat(rgb & 0xFF) / 255.0
        return UIColor(red: r, green: g, blue: b, alpha: alpha)
    }
    class func colorWithHex(hex: String) -> UIColor {
        return UIColor.colorWithHex(hex: hex, alpha: 1.0)
    }
    //背景主题颜色
    class func globalBackgroundColor() -> UIColor {
        return UIColor.colorWithHex(hex: "#EEEEEE", alpha: 1.0)
    }
    //AP主题颜色
    @objc class func globalSoftwareColor() -> UIColor {
        return UIColor.colorWithHex(hex: "#45bcba", alpha: 1.0)
    }
    //主题字体颜色 #333333
    class func mainFontColor() -> UIColor {
        return UIColor.colorWithHex(hex: "#333333", alpha: 1.0)
    }
    //二级字体颜色
    class func secondaryFont() -> UIColor {
        return UIColor.colorWithHex(hex: "#999999", alpha: 1.0)
    }
    //分割线颜色
    class func dividingLine() -> UIColor {
        return UIColor.colorWithHex(hex: "#d1d1d1", alpha: 1.0)
    }
    
}
