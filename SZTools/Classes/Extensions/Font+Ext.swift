//
//  Font+Ext.swift
//  Pods-SZTools_Example
//
//  Created by Will on 2019/7/27.
//

import Foundation

public extension UIFont {
    
    //MARK: - font
    class func zs_PingFangSCRegular(_ fontSize: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Regular", size: fontSize)!
    }
    
    class func zs_PingFangSCBold(_ fontSize: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Semibold", size: fontSize)!
    }
    
    class func zs_PingFangSCMedium(_ fontSize: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Medium", size: fontSize)!
    }
    
    class func zs_PingFangSCLight(_ fontSize: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Light", size: fontSize)!
    }
    
    class func zs_PingFangSCThin(_ fontSize: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Ultralight", size: fontSize)!
    }

}
