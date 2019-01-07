//
//  UIColor+Ext.swift
//  iReader
//
//  Created by WillZh on 2018/7/2.
//  Copyright © 2018年 NoOrg. All rights reserved.
//

import Foundation
import UIKit

//MARK: - color

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    
    /// 以 16 进制方式创建 UIColor，全局方法
    class func hexColorWithAlpha(_ hex: Int, _ alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: (hex >> 16) & 0xFF, green: (hex >> 8) & 0xFF, blue: hex & 0xFF).withAlphaComponent(alpha)
    }
    
    /// 返回16进制字符串
    func hexString() -> String {
        return hexStringWithAlpha(false)
    }
    
    func hexStringWithAlpha() -> String {
        return hexStringWithAlpha(true)
    }
    
    func hexStringWithAlpha(_ withAlpha: Bool) -> String {
        let count = cgColor.numberOfComponents
        let components = cgColor.components
        let stringFormat = "%02x%02x%02x"
        
        var hex: String?
        if count == 2 {
            let white = components![0] * 255.0
            hex = String(format: stringFormat, white, white, white)
        }else if count == 4 {
            hex = String(format: stringFormat, (components![0] * 255.0), (components![1] * 255.0), (components![2] * 255.0))
        }
        
        if hex != nil && withAlpha {
            //hex = hex!.appendingFormat("%02lx", (self.alpha * 255.0 + 0.5))
        }
        return hex!
    }
    
}






