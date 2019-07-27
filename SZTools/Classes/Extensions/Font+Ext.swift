//
//  Font+Ext.swift
//  Pods-SZTools_Example
//
//  Created by Will on 2019/7/27.
//

import Foundation

public extension UIFont {
    
    
    //MARK: - font
    func zs_PingFangSCRegular(_ fontSize: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Regular", size: fontSize)!
    }
    
    func zs_PingFangSCBold(_ fontSize: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Semibold", size: fontSize)!
    }
    
    func zs_PingFangSCMedium(_ fontSize: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Medium", size: fontSize)!
    }
    
    func zs_PingFangSCLight(_ fontSize: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Light", size: fontSize)!
    }
    
    func zs_PingFangSCThin(_ fontSize: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Ultralight", size: fontSize)!
    }

}
