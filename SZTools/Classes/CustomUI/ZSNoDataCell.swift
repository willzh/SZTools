//
//  ZSNoDataCell.swift
//  iReader
//
//  Created by WillZh on 2018/11/29.
//  Copyright © 2018年 NoOrg. All rights reserved.
//

import UIKit


public class ZSNoDataTableCell: UITableViewCell {
    
    @IBOutlet public var imgv_cover: UIImageView?
    @IBOutlet public var label_title: UILabel?
    @IBOutlet public var layout_y: NSLayoutConstraint?
    
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        layout_y?.constant -= ZS_StatusAndNavBarHeight
    }
    
}

public class ZSNoDataCollectionCell: UICollectionViewCell {
    
    @IBOutlet public var imgv_cover: UIImageView?
    @IBOutlet public var label_title: UILabel?
    @IBOutlet public var layout_y: NSLayoutConstraint?
    @IBOutlet public var btn_action: UIButton?
    
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        layout_y?.constant -= ZS_StatusAndNavBarHeight
    }
    
}
