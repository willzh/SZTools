//
//  UIView+Layout.swift
//  ZSFileBrowser
//
//  Created by Will on 2019/3/22.@discardableResult
//  Copyright © 2019年 NoOrg. All rights reserved.
//

import UIKit
import Foundation

public extension UIView {
    
    /// 添加一个宽度约束
    @discardableResult
    func zs_addWidthConstraint(_ width: CGFloat) -> NSLayoutConstraint {
        let lc = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: width)
        self.addConstraint(lc)
        return lc
    }
    
    /// 添加一个高度约束
    @discardableResult
    func zs_addHeightConstraint(_ height: CGFloat) -> NSLayoutConstraint {
        let lc = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: height)
        self.addConstraint(lc)
        return lc
    }
    
    /// 等宽约束
    @discardableResult
    func zs_equalWidth(view: Any, multiplier: CGFloat = 1.0, constant: CGFloat = 0.0) -> NSLayoutConstraint {
        let lc = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: multiplier, constant: constant)
        self.addConstraint(lc)
        return lc
    }
    
    /// 等高约束
    @discardableResult
    func zs_equalHeight(view: Any, multiplier: CGFloat = 1.0, constant: CGFloat = 0.0) -> NSLayoutConstraint {
        let lc = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: multiplier, constant: constant)
        self.addConstraint(lc)
        return lc
    }
    
    /// 添加一个高度约束
    @discardableResult
    func zs_addHeightConstraint2(_ height: CGFloat) -> NSLayoutConstraint {
        let lc = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: height)
        self.addConstraint(lc)
        return lc
    }
    
    // leading 与 left 的不同：在阿拉伯国家和某些国家，leading 表示右边
    /// 与 view leading 对齐的约束
    @discardableResult
    func zs_leadingTo(view: Any, constant: CGFloat) -> NSLayoutConstraint {
        let lc = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: constant)
        self.addConstraint(lc)
        return lc
    }
    
    /// 与 view leading 对齐的约束
    @discardableResult
    func zs_leadingAlign(view: Any, constant: CGFloat = 0.0) -> NSLayoutConstraint {
        let lc = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: constant)
        self.addConstraint(lc)
        return lc
    }
    
    /// 与 view trailing 对齐的约束
    @discardableResult
    func zs_trailingAlign(view: Any, constant: CGFloat = 0.0) -> NSLayoutConstraint {
        let lc = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: constant)
        self.addConstraint(lc)
        return lc
    }
    
    
    /// self 的 leading 与 view 的 trailing 距离约束
    @discardableResult
    func zs_followTo(view: Any, constant: CGFloat = 0.0) -> NSLayoutConstraint {
        let lc = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: constant)
        self.addConstraint(lc)
        return lc
    }
    
    /// self 的 top 与 view 的 bottom 距离约束
    @discardableResult
    func zs_under(view: Any, constant: CGFloat = 0.0) -> NSLayoutConstraint {
        let lc = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: constant)
        self.addConstraint(lc)
        return lc
    }
    
    
}
