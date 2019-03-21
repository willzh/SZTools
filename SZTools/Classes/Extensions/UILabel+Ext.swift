//
//  UILabel+Ext.swift
//  iReader
//
//  Created by WillZh on 2018/9/6.
//  Copyright © 2018年 NoOrg. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    
    /// 创建一个 label
    public class func create(font: UIFont, color: UIColor, text: String, frame: CGRect, alignment: NSTextAlignment = .left) -> UILabel {
        let label = UILabel(frame: frame)
        label.font = font
        label.textColor = color
        label.text = text
        label.textAlignment = alignment
        
        return label
    }
    
    /// 计算 label 中文字 size
    public func textSize() -> CGSize {
        
        let style = NSMutableParagraphStyle()
        style.lineBreakMode = .byWordWrapping
        
        let attributes = [NSAttributedString.Key.font: self.font!, NSAttributedString.Key.paragraphStyle: style]
        let nsstr =  self.text! as NSString
        return nsstr.boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude), options: .usesLineFragmentOrigin, attributes: attributes, context: nil).size
    }
    
    
}
