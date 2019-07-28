//
//  UIView+Nib.swift
//  Pods-SZTools_Example
//
//  Created by Will on 2019/3/21.
//

import Foundation
import UIKit

public extension UIView {
    
    class func zs_nib(nibName: String) -> UINib {
        return UINib(nibName: nibName, bundle: Bundle.main)
    }
    
    class func zs_instanceFromNib() -> UIView? {
        return zs_instanceFromNib(nibName: className())
    }
    
    class func zs_instanceFromNib(nibName: String) -> UIView? {
        return zs_instanceFromNib(nibName: nibName, owner: nil)
    }
    
    class func zs_instanceFromNib(nibName: String, owner: Any?) -> UIView? {
        return zs_instanceFromNib(nibName: nibName, owner: owner, bundle: Bundle.main)
    }
    
    class func zs_instanceFromNib(nibName: String, owner: Any?, bundle: Bundle) -> UIView? {
        let arr = bundle.loadNibNamed(nibName, owner: owner, options: nil)
        guard let elements = arr else {
            return nil
        }
        for elm in elements {
            if elm is UIView {
                return elm as? UIView
            }
        }
        return nil
    }
    
    
    // 类方法，获取类名
    fileprivate class func className() -> String {
        
        let components = description().components(separatedBy: ".")
        if components.count > 1 {
            return components.last!
        }
        return components.first!
    }
    
    
}
