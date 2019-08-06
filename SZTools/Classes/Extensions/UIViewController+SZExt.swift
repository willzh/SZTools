//
//  UIViewController+Alert.swift
//  iReader
//
//  Created by WillZh on 2018/7/11.
//  Copyright © 2018年 NoOrg. All rights reserved.
//

import Foundation
import UIKit




public extension UIViewController {
    
    /// 显示一个 UIAlertController
    ///
    /// - Parameters:
    ///   - title: 标题
    ///   - msg: 提示内容
    ///   - cancelTitle: 取消键标题，默认为 '取消'
    ///   - buttons: 其他按钮标题
    ///   - handle: 点击按钮回调，可以根据按钮标题名称来判断具体事件
    func zs_showSystemAlert(title: String?, msg: String?, cancelTitle: String? = "取消", buttons: [String], handle: ((_ title: String) -> Void)?) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        
        // 添加取消按钮
        alert.addAction(UIAlertAction(title: cancelTitle, style: .cancel, handler: nil))
        
        // 添加自定义按钮
        for bt in buttons {
            let action = UIAlertAction(title: bt, style: .default) { (alertAction) in
                guard let block = handle else {
                    return
                }
                block(bt) // 调用 block 返回
                alert.dismiss(animated: true, completion: nil)
            }
            alert.addAction(action)
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
}




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





public extension UIViewController {
    
    /// 导航 push 到一个 ViewController
    func zs_pushTo(_ vc: UIViewController, animated: Bool = true) {
        self.navigationController?.pushViewController(vc, animated: animated)
    }
    
    /// 导航 pop 到上一个 ViewController
    func zs_pop(_ animated: Bool = true) -> UIViewController? {
        return self.navigationController?.popViewController(animated: animated)
    }
    
    /// 导航 pop 到根 ViewController
    func zs_popToRoot(_ animated: Bool = true) -> [UIViewController]? {
        return self.navigationController?.popToRootViewController(animated: animated)
    }
    
    /// 导航 pop 到指定的 vc
    func zs_popTo(_ vc: UIViewController, animated: Bool = true) -> [UIViewController]? {
        return self.navigationController?.popToViewController(vc, animated: animated)
    }
    
    /// 导航 pop 指定数量的层级。比如有 A,B,C 3个VC，当 length == 2 时，将返回到 A
    func zs_popStack(_ length: Int, animated: Bool = true) {
        if length == 1 {
            _ = self.zs_pop()
            return
        }
        let arr = self.navigationController?.viewControllers
        guard let vcs = arr else {
            return
        }
        if length >= vcs.count {
            return
        }
        let level = vcs.count - length
        if level == 1{
            _ = self.zs_popToRoot()
            return
        }
        var tempVCs = [UIViewController]()
        for i in 0 ..< level {
            tempVCs.append(vcs[i])
        }
        self.navigationController?.setViewControllers(tempVCs, animated: animated)
    }
    
    
    
    /// present 到一个 ViewController
    func zs_presentTo(_ vc: UIViewController, animated: Bool = true) {
        self.present(vc, animated: animated, completion: nil)
    }
    
    /// dismiss
    func zs_dismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
