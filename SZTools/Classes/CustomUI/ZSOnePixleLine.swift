//
//  ZSOnePixleLine.swift
//  SZTools_Example
//
//  Created by Will on 2019/8/6.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class ZSOnePixleLine: UIView {

    /// 是否垂直的线条
    @IBInspectable var vertical: Bool = false {
        didSet {
            setUp()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setUp()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.setUp()
    }
    
    
    //MARK: - Private Methods
    private func setUp() {
        
        for lc in constraints {
            if makeLineConstraint(lc, isVer: vertical) {
                break
            }
        }
    }
    
    private func makeLineConstraint(_ constraint: NSLayoutConstraint, isVer: Bool) -> Bool {
        if isVer {
            if constraint.firstAttribute == .width {
                constraint.constant = 1 / UIScreen.main.scale
                return true
            }
        }else {
            if constraint.firstAttribute == .height {
                constraint.constant = 1 / UIScreen.main.scale
                return true
            }
        }
        return false
    }
    
}
