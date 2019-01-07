//
//  ZSNoDataCell.swift
//  iReader
//
//  Created by WillZh on 2018/11/29.
//  Copyright © 2018年 NoOrg. All rights reserved.
//

import UIKit


class ZSNoDataTableCell: UITableViewCell {
    
    @IBOutlet var imgv_cover: UIImageView?
    @IBOutlet var label_title: UILabel?
    @IBOutlet var layout_y: NSLayoutConstraint?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layout_y?.constant -= ZS_StatusAndNavBarHeight
    }
    
}

class ZSNoDataCollectionCell: UICollectionViewCell {
    
    @IBOutlet var imgv_cover: UIImageView?
    @IBOutlet var label_title: UILabel?
    @IBOutlet var layout_y: NSLayoutConstraint?
    @IBOutlet var btn_action: UIButton?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layout_y?.constant -= ZS_StatusAndNavBarHeight
    }
    
}
