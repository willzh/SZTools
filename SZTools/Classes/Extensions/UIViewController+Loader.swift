//
//  UIViewController+Loader.swift
//  iReader
//
//  Created by WillZh on 2018/7/7.
//  Copyright © 2018年 NoOrg. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController {
    
    /// 从 storyboard 中初始化 ViewController，storyboard Id 必须和类名相同
    ///
    /// - Parameter sbname: storyboard 名称
    /// - Returns: UIViewController 实例
    class func zs_loadFromSB(_ sbname: String) -> UIViewController {
        let sb = UIStoryboard.init(name: sbname, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: NSStringFromClass(self).components(separatedBy: ".").last!)
        
        return vc
    }
    
    
}
