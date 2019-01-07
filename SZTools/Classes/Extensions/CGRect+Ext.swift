//
//  CGRect+Ext.swift
//  iReader
//
//  Created by WillZh on 2018/7/11.
//  Copyright © 2018年 NoOrg. All rights reserved.
//

import CoreGraphics

extension CGRect {
    
    public var minEdge: CGFloat {
        return min(width, height)
    }
    
    
    public func setMinX(_ minx: CGFloat) -> CGRect {
        return CGRect(origin: CGPoint(x: minx, y: origin.y), size: size)
    }
    
    public func setMinY(_ miny: CGFloat) -> CGRect {
        return CGRect(origin: CGPoint(x: origin.x, y: miny), size: size)
    }
    
    public func setOrigin(_ x: CGFloat, _ y: CGFloat) -> CGRect {
        return CGRect(origin: CGPoint(x: x, y: y), size: size)
    }
    
    public func setOrigin(_ origin: CGPoint) -> CGRect {
        return CGRect(origin: origin, size: size)
    }
    
    
    
    public func setWidth(_ width: CGFloat) -> CGRect {
        return CGRect(origin: origin, size: CGSize(width: width, height: size.height))
    }
    
    public func setHeight(_ height: CGFloat) -> CGRect {
        return CGRect(origin: origin, size: CGSize(width: size.width, height: height))
    }
    
    public func setSize(_ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(origin: origin, size: CGSize(width: width, height: height))
    }
    
    public func setSize(_ size: CGSize) -> CGRect {
        return CGRect(origin: origin, size: size)
    }
}
