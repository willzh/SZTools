//
//  UIViewController+Jump.swift
//  ZSFileBrowser
//
//  Created by Will on 2019/3/22.
//  Copyright © 2019年 NoOrg. All rights reserved.
//

import UIKit
import Foundation


extension UIViewController {
    
    /// 导航 push 到一个 ViewController
    public func pushTo(_ vc: UIViewController, animated: Bool = true) {
        self.navigationController?.pushViewController(vc, animated: animated)
    }
    
    /// 导航 pop 到上一个 ViewController
    public func pop(_ animated: Bool = true) -> UIViewController? {
        return self.navigationController?.popViewController(animated: animated)
    }
    
    /// 导航 pop 到根 ViewController
    public func popToRoot(_ animated: Bool = true) -> [UIViewController]? {
        return self.navigationController?.popToRootViewController(animated: animated)
    }
    
    /// 导航 pop 到指定的 vc
    public func popTo(_ vc: UIViewController, animated: Bool = true) -> [UIViewController]? {
        return self.navigationController?.popToViewController(vc, animated: animated)
    }
    
    /// 导航 pop 指定数量的层级。比如有 A,B,C 3个VC，当 length == 2 时，将返回到 A
    public func popStack(_ length: Int, animated: Bool = true) {
        if length == 1 {
            _ = self.pop()
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
            _ = self.popToRoot()
            return
        }
        var tempVCs = [UIViewController]()
        for i in 0 ..< level {
            tempVCs.append(vcs[i])
        }
        self.navigationController?.setViewControllers(tempVCs, animated: animated)
    }
    
    
}
