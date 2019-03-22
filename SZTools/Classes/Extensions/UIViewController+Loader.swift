//
//  UIViewController+Loader.swift
//  iReader
//
//  Created by WillZh on 2018/7/7.
//  Copyright © 2018年 NoOrg. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    /// 从 storyboard 中初始化 ViewController，storyboard Id 必须和类名相同
    ///
    /// - Parameter sbname: storyboard 名称
    /// - Returns: UIViewController 实例
    public class func loadFromSB(_ sbname: String) -> UIViewController {
        let sb = UIStoryboard.init(name: sbname, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: NSStringFromClass(self).components(separatedBy: ".").last!)
        
        return vc
    }
    
    /// 返回指定的 storyboard 名称，由具体的类中实现
    @objc open class func storyboardName() -> String? {
        return nil
    }
    
    /// 实例化一个类，如果类中有返回 storyboardName，会从指定的 storyboard 中加载，没有则调用默认的 init
    public class func zs_instance() -> UIViewController {
        let sbName = storyboardName()
        if sbName == nil {
            return self.init()
        }
        return loadFromSB(sbName!)
    }
    
}
