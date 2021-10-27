//
//  Device+Ext.swift
//  Pods-SZTools_Example
//
//  Created by Will on 2019/3/21.
//

import Foundation
import UIKit


public extension UIDevice {
    
    
    /// 屏幕尺寸
    class func zs_screenSize () -> CGSize {
        return UIScreen.main.bounds.size
    }
    
    /// 屏幕宽度
    class func zs_screenWidth () -> CGFloat {
        return zs_screenSize().width
    }
    
    /// 屏幕高度
    class func zs_screenHeight () -> CGFloat {
        return zs_screenSize().height
    }
    
    /// 获取 window
    private class func getWindow() -> UIWindow {
        var window = UIApplication.shared.keyWindow
        if window == nil {
            window = UIWindow(frame: UIScreen.main.bounds)
        }
        return window!
    }
    
    /// 是否有安全区域
    class func zs_haveSafeArea () -> Bool {
        let window = getWindow()
        return window.safeAreaInsets.bottom != 0 || window.safeAreaInsets.top != 0
    }
    
    /// 判断是否是ipad
    class func zs_isiPad () -> Bool {
        return current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
    }
    
    /// 判断是否系统是否比 iOS 11 高
    class func zs_iOS11Upper() -> Bool {
        if #available(iOS 11.0, *) {
            return true
        }
        return false
    }
    
    
    /// 状态栏和导航条总共高度.
    class func zs_statusAndNavBarHeight () -> CGFloat {
        return zs_safeAreaTop() + 64
    }
    
    /// 状态栏高度。
    class func zs_statusBarHeight () -> CGFloat {
        return zs_safeAreaTop() + 20
    }
    
    /// 顶部安全区域高度。
    class func zs_safeAreaTop () -> CGFloat {
        return getWindow().safeAreaInsets.top
    }
    
    /// 底部安全区域高度. x 系列手机等于 34，其他等于 0
    class func zs_safeAreaBottom () -> CGFloat {
        return getWindow().safeAreaInsets.bottom
    }
    
    
    
    
}
