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
    func setMinX(_ minx: CGFloat) {
        
        var sf = self.frame
        sf.origin.x = minx
        self.frame = sf
    }
    
    func setMinY(_ miny: CGFloat) {
        
        var sf = self.frame
        sf.origin.y = miny
        self.frame = sf
    }
    
    func setOrigin(_ x: CGFloat, _ y: CGFloat) {
        
        var sf = self.frame
        sf.origin.x = x
        sf.origin.y = y
        self.frame = sf
    }
    
    func setWidth(_ width: CGFloat) {
        
        var sf = self.frame
        sf.size.width = width
        self.frame = sf
    }
    
    func setHeight(_ height: CGFloat) {
        
        var sf = self.frame
        sf.size.height = height
        self.frame = sf
    }
    
    func setSize(_ width: CGFloat, _ height: CGFloat) {
        
        var sf = self.frame
        sf.size.width = width
        sf.size.height = height
        self.frame = sf
    }
    
    
    //MARK: - create
    class func create(_ frame: CGRect, backgroundColor: UIColor = .white) -> UIView {
        let tv = UIView(frame: frame)
        tv.backgroundColor = backgroundColor
        
        return tv
    }
    
    
    
}
