//
//  CGRect+Ext.swift
//  iReader
//
//  Created by WillZh on 2018/7/11.
//  Copyright © 2018年 NoOrg. All rights reserved.
//

import CoreGraphics

public extension CGRect {
    
    var zs_minEdge: CGFloat {
        return min(width, height)
    }
    
    
    func zs_setMinX(_ minx: CGFloat) -> CGRect {
        return CGRect(origin: CGPoint(x: minx, y: origin.y), size: size)
    }
    
    func zs_setMinY(_ miny: CGFloat) -> CGRect {
        return CGRect(origin: CGPoint(x: origin.x, y: miny), size: size)
    }
    
    func zs_setOrigin(_ x: CGFloat, _ y: CGFloat) -> CGRect {
        return CGRect(origin: CGPoint(x: x, y: y), size: size)
    }
    
    func zs_setOrigin(_ origin: CGPoint) -> CGRect {
        return CGRect(origin: origin, size: size)
    }
    
    
    
    func zs_setWidth(_ width: CGFloat) -> CGRect {
        return CGRect(origin: origin, size: CGSize(width: width, height: size.height))
    }
    
    func zs_setHeight(_ height: CGFloat) -> CGRect {
        return CGRect(origin: origin, size: CGSize(width: size.width, height: height))
    }
    
    func zs_setSize(_ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(origin: origin, size: CGSize(width: width, height: height))
    }
    
    func zs_setSize(_ size: CGSize) -> CGRect {
        return CGRect(origin: origin, size: size)
    }
}
