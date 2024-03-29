//
//  UIButton+Ext.swift
//  iReader
//
//  Created by WillZh on 2018/9/6.
//  Copyright © 2018年 NoOrg. All rights reserved.
//

import Foundation
import UIKit

public extension UIButton {
    
    class func zs_create(_ type: UIButton.ButtonType = .system, image: UIImage?, title: String = "", frame: CGRect = .zero, target: Any?, action: Selector?, forEvents: UIControl.Event = .touchUpInside) -> UIButton {
        let btn = UIButton.init(type: type)
        btn.frame = frame
        btn.setTitle(title, for: UIControl.State.normal)
        if (image != nil) {
            btn.setImage(image, for: UIControl.State.normal)
        }
        
        if target != nil && action != nil {
            btn.addTarget(target!, action: action!, for: forEvents)
        }
        
        return btn
    }
    
    
}
