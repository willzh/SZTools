//
//  UIView.swift
//  iReader
//
//  Created by WillZh on 2018/8/24.
//  Copyright © 2018年 NoOrg. All rights reserved.
//

import UIKit



extension UIView {
    
    //MARK: - frame
    /// set origin x
    public func setMinX(_ minx: CGFloat) {
        
        var sf = self.frame
        sf.origin.x = minx
        self.frame = sf
    }
    
    public func setMinY(_ miny: CGFloat) {
        
        var sf = self.frame
        sf.origin.y = miny
        self.frame = sf
    }
    
    public func setOrigin(_ x: CGFloat, _ y: CGFloat) {
        
        var sf = self.frame
        sf.origin.x = x
        sf.origin.y = y
        self.frame = sf
    }
    
    public func setWidth(_ width: CGFloat) {
        
        var sf = self.frame
        sf.size.width = width
        self.frame = sf
    }
    
    public func setHeight(_ height: CGFloat) {
        
        var sf = self.frame
        sf.size.height = height
        self.frame = sf
    }
    
    public func setSize(_ width: CGFloat, _ height: CGFloat) {
        
        var sf = self.frame
        sf.size.width = width
        sf.size.height = height
        self.frame = sf
    }
    
    
    //MARK: - create
    public class func create(_ frame: CGRect, backgroundColor: UIColor = .white) -> UIView {
        let tv = UIView(frame: frame)
        tv.backgroundColor = backgroundColor
        
        return tv
    }
    
    
    
}
