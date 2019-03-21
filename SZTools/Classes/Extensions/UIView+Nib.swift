//
//  UIView+Nib.swift
//  Pods-SZTools_Example
//
//  Created by Will on 2019/3/21.
//

import Foundation

extension UIView {
    
    public class func nib(nibName: String) -> UINib {
        return UINib(nibName: nibName, bundle: Bundle.main)
    }
    
    public class func instanceFromNib() -> UIView? {
        return instanceFromNib(nibName: className())
    }
    
    public class func instanceFromNib(nibName: String) -> UIView? {
        return instanceFromNib(nibName: nibName, owner: nil)
    }
    
    public class func instanceFromNib(nibName: String, owner: Any?) -> UIView? {
        return instanceFromNib(nibName: nibName, owner: owner, bundle: Bundle.main)
    }
    
    public class func instanceFromNib(nibName: String, owner: Any?, bundle: Bundle) -> UIView? {
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
