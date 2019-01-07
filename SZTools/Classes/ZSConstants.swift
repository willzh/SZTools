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
func screenSize () -> CGSize {
    return UIScreen.main.bounds.size
}

func screenWidth () -> CGFloat {
    return screenSize().width
}

func screenHeight () -> CGFloat {
    return screenSize().height
}

func iPhoneX () -> Bool {
    return screenHeight() == 812
}

let ZS_StatusAndNavBarHeight: CGFloat = iPhoneX() ? 88 : 64  /// 状态栏和导航条总共高度
let ZS_StatusBarHeight: CGFloat = iPhoneX() ? 44 : 20
let ZS_SafeAreaTop: CGFloat = iPhoneX() ? 24 : 0
let ZS_SafeAreaBottom: CGFloat = iPhoneX() ? 34 : 0



//MARK: - rect
func Rect(_ x: CGFloat, _ y: CGFloat, _ w: CGFloat, _ h: CGFloat) -> CGRect {
    return CGRect(x: x, y: y, width: w, height: h)
}

func Rect(_ x: CGFloat, _ y: CGFloat, _ size: CGSize) -> CGRect {
    return CGRect(origin: CGPoint(x: x, y: y), size: size)
}

func Rect(_ origin: CGPoint, _ w: CGFloat, _ h: CGFloat) -> CGRect {
    return CGRect(origin: origin, size: CGSize(width: w, height: h))
}


//MARK: - font
func PingFangSCRegular(_ fontSize: CGFloat) -> UIFont {
    return UIFont(name: "PingFangSC-Regular", size: fontSize)!
}

func PingFangSCBold(_ fontSize: CGFloat) -> UIFont {
    return UIFont(name: "PingFangSC-Semibold", size: fontSize)!
}

func PingFangSCMedium(_ fontSize: CGFloat) -> UIFont {
    return UIFont(name: "PingFangSC-Medium", size: fontSize)!
}

func PingFangSCLight(_ fontSize: CGFloat) -> UIFont {
    return UIFont(name: "PingFangSC-Light", size: fontSize)!
}

func PingFangSCThin(_ fontSize: CGFloat) -> UIFont {
    return UIFont(name: "PingFangSC-Ultralight", size: fontSize)!
}



//MARK: - 本地化
func Localized(_ key: String) -> String {
    // 多语言本地化，下面两种方法都可以，默认的 tableName 是 Localizable，首字母要大写。comment 是一个注释，这里不需要
    return NSLocalizedString(key, comment: "")
    //return NSLocalizedString(key, tableName: "Localizable", comment: "")
}


