//
//  ZSConstants.swift
//  iReader
//
//  Created by WillZh on 2018/6/30.
//  Copyright © 2018年 NoOrg. All rights reserved.
//
//  常量


import CoreGraphics
import UIKit


//MARK: - 常量
public func screenSize () -> CGSize {
    return UIScreen.main.bounds.size
}

public func screenWidth () -> CGFloat {
    return screenSize().width
}

public func screenHeight () -> CGFloat {
    return screenSize().height
}

public func iPhoneX () -> Bool {
    return screenHeight() == 812
}

/// 状态栏和导航条总共高度. x 系列手机等于 88，其他等于 64
public let ZS_StatusAndNavBarHeight: CGFloat = iPhoneX() ? 88 : 64
/// 状态栏高度。 x 系列手机等于 44，其他等于 20
public let ZS_StatusBarHeight: CGFloat = iPhoneX() ? 44 : 20
/// 顶部安全区域高度。 x 系列手机等于 24，其他等于 0
public let ZS_SafeAreaTop: CGFloat = iPhoneX() ? 24 : 0
/// 底部安全区域高度. x 系列手机等于 34，其他等于 0
public let ZS_SafeAreaBottom: CGFloat = iPhoneX() ? 34 : 0



//MARK: - rect
public func Rect(_ x: CGFloat, _ y: CGFloat, _ w: CGFloat, _ h: CGFloat) -> CGRect {
    return CGRect(x: x, y: y, width: w, height: h)
}

public func Rect(_ x: CGFloat, _ y: CGFloat, _ size: CGSize) -> CGRect {
    return CGRect(origin: CGPoint(x: x, y: y), size: size)
}

public func Rect(_ origin: CGPoint, _ w: CGFloat, _ h: CGFloat) -> CGRect {
    return CGRect(origin: origin, size: CGSize(width: w, height: h))
}


//MARK: - font
public func PingFangSCRegular(_ fontSize: CGFloat) -> UIFont {
    return UIFont(name: "PingFangSC-Regular", size: fontSize)!
}

public func PingFangSCBold(_ fontSize: CGFloat) -> UIFont {
    return UIFont(name: "PingFangSC-Semibold", size: fontSize)!
}

public func PingFangSCMedium(_ fontSize: CGFloat) -> UIFont {
    return UIFont(name: "PingFangSC-Medium", size: fontSize)!
}

public func PingFangSCLight(_ fontSize: CGFloat) -> UIFont {
    return UIFont(name: "PingFangSC-Light", size: fontSize)!
}

public func PingFangSCThin(_ fontSize: CGFloat) -> UIFont {
    return UIFont(name: "PingFangSC-Ultralight", size: fontSize)!
}



//MARK: - 本地化
public func Localized(_ key: String) -> String {
    // 多语言本地化，下面两种方法都可以，默认的 tableName 是 Localizable，首字母要大写。comment 是一个注释，这里不需要
    return NSLocalizedString(key, comment: "")
    //return NSLocalizedString(key, tableName: "Localizable", comment: "")
}


