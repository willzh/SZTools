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


//MARK: - rect
public func zs_Rect(_ x: CGFloat, _ y: CGFloat, _ w: CGFloat, _ h: CGFloat) -> CGRect {
    return CGRect(x: x, y: y, width: w, height: h)
}

public func zs_Rect(_ x: CGFloat, _ y: CGFloat, _ size: CGSize) -> CGRect {
    return CGRect(origin: CGPoint(x: x, y: y), size: size)
}

public func zs_Rect(_ origin: CGPoint, _ w: CGFloat, _ h: CGFloat) -> CGRect {
    return CGRect(origin: origin, size: CGSize(width: w, height: h))
}



//MARK: - 本地化
public func zs_Localized(_ key: String) -> String {
    // 多语言本地化，下面两种方法都可以，默认的 tableName 是 Localizable，首字母要大写。comment 是一个注释，这里不需要
    return NSLocalizedString(key, comment: "")
    //return NSLocalizedString(key, tableName: "Localizable", comment: "")
}


//MARK: - 常用 Block
/// 空参数的回调 block
public typealias zs_VoidBlock = () -> Void
