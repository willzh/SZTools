//
//  Device+Ext.swift
//  Pods-SZTools_Example
//
//  Created by Will on 2019/3/21.
//

import Foundation


extension UIDevice {
    
    
    /// 屏幕尺寸
    public class func zs_screenSize () -> CGSize {
        return UIScreen.main.bounds.size
    }
    
    /// 屏幕宽度
    public class func zs_screenWidth () -> CGFloat {
        return zs_screenSize().width
    }
    
    /// 屏幕高度
    public class func zs_screenHeight () -> CGFloat {
        return zs_screenSize().height
    }
    
    
    
    /// 是否 X 系列手机
    public class func zs_isiPhoneX () -> Bool {
        let h = zs_screenHeight()
        return h == 812.0 || h == 896.0
    }
    
    /// 判断是否是ipad
    public class func zs_isiPad () -> Bool {
        return current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
    }
    
    /// 判断是否系统是否比 iOS 11 高
    public class func zs_iOS11Upper() -> Bool {
        if #available(iOS 11.0, *) {
            return true
        }
        return false
    }
    
    
    /// 状态栏和导航条总共高度. x 系列手机等于 88，其他等于 64
    public class func zs_statusAndNavBarHeight () -> CGFloat {
        return zs_isiPhoneX() ? 88 : 64
    }
    
    /// 状态栏高度。 x 系列手机等于 44，其他等于 20
    public class func zs_statusBarHeight () -> CGFloat {
        return zs_isiPhoneX() ? 44 : 20
    }
    
    /// 顶部安全区域高度。 x 系列手机等于 24，其他等于 0
    public class func zs_safeAreaTop () -> CGFloat {
        return zs_isiPhoneX() ? 24 : 0
    }
    
    /// 底部安全区域高度. x 系列手机等于 34，其他等于 0
    public class func zs_safeAreaBottom () -> CGFloat {
        return zs_isiPhoneX() ? 34 : 0
    }
    
    
    
    
}
