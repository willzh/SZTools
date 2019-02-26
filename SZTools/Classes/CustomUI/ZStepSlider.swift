
//
//  ZStepSlider.swift
//  iReader
//
//  Created by WillZh on 2018/9/12.
//  Copyright © 2018年 NoOrg. All rights reserved.
//

import UIKit

/// 步进式 slider ---.---.---.---.---
public class ZStepSlider: UIControl {

    /// 最大值
    public var maxCount: UInt = 0
    
    /// 当前选中的索引
    public var index: UInt = 0 {
        didSet {
            
        }
    }
    
    /// 滑动条的高度
    public var trackHeight: CGFloat = 2.0
    
    /// 已滑动过的部分颜色
    public var trackColor: UIColor = .blue
    
    /// 已滑动过部分点的颜色
    public var trackDotColor: UIColor = .white
    
    /// 未滑到的部分的颜色
    public var sliderColor: UIColor = .lightGray
    
    /// 已滑动过部分点的图片
    public var trackDotImage: UIImage?
    
    /// 滑块的颜色
    public var thumbDotColor: UIColor = .lightGray
    
    /// 滑块的图片
    public var thumbDotImage: UIImage?
    
    /// 分割点是否可以点击
    public var dotIsUserInteractionEnabled = true
    
    /// 开始点击的位置
    public var startTouchPosition: CGPoint?
    
    /// 开始点击时，滑块的位置
    public var startThumbPosition: CGPoint?
    
    public lazy var thumbLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.contentsScale = UIScreen.main.scale
        
        if trackDotImage != nil {
            layer.contents = trackDotImage?.cgImage
        }else {
            let size = thumbSize()
            layer.path = UIBezierPath(roundedRect: Rect(0, 0, size.width, size.height), cornerRadius: size.height / 2.0).cgPath
            layer.fillColor = thumbDotColor.cgColor
            layer.frame = Rect(0, self.bounds.midY - size.height / 2.0, size)
        }
        
        return layer
    }()
    
    
    
    //MARK: - init
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        
        self.layer.addSublayer(thumbLayer)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //MARK: -
    public func setIndex(_ index: UInt, animated: Bool) {
        
        // 点之间的间隔长度
        let len = frame.width / CGFloat(maxCount - 1)
        
        let size = thumbSize()
        thumbLayer.frame = Rect(len * CGFloat(index) - size.width / 2.0, (frame.height - size.height) / 2.0, size.width, size.height)
        
    }
    
    
    
    
    //MARK: -
    override public func draw(_ rect: CGRect) {
        
        // 背景
        let sliderFrame = Rect(trackHeight / 2.0, (rect.height - trackHeight) / 2.0, rect.width - trackHeight, trackHeight)
        
        let ctx = UIGraphicsGetCurrentContext()
        
        ctx?.setFillColor(sliderColor.cgColor)
        ctx?.fill(sliderFrame)
        
        // 每个点的宽度
        let dotLen = trackHeight * 2
        // 点之间的间隔长度
        let len = (rect.width - dotLen * CGFloat(maxCount)) / CGFloat(maxCount - 1)
        
        // 已滑动部分
//        if index > 0 {
//            var trackFrame = sliderFrame
//            trackFrame.size.width = (len + dotLen) * CGFloat(index) + trackHeight
//
//            ctx?.setFillColor(trackColor.cgColor)
//            ctx?.fill(trackFrame)
//        }
        
        // 点
        for i in 0..<maxCount {
            let x = (len + dotLen) * CGFloat(i)
            let dotFrame = Rect(x, sliderFrame.midY - trackHeight, dotLen, dotLen)
            //ctx?.setFillColor((i > index) ? thumbDotColor.cgColor : trackDotColor.cgColor)
            ctx?.setFillColor(trackDotColor.cgColor)
            ctx?.fillEllipse(in: dotFrame)
        }
        
    }
    
    func thumbSize() -> CGSize {
        return CGSize(width: trackHeight * 4, height: trackHeight * 4)
    }
    
    func dotSize() -> CGSize {
        return CGSize(width: trackHeight * 2, height: trackHeight * 2)
    }
    
    func lengthOfDots() -> CGFloat {
        // 每个点的宽度
        let dotLen = trackHeight * 2
        // 点之间的间隔长度
        return (self.frame.width - dotLen * CGFloat(maxCount)) / CGFloat(maxCount - 1)
    }
    
    
    
    //MARK: -  Tracking
    override public func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        startTouchPosition = touch.location(in: self)
        startThumbPosition = thumbLayer.position
        
        if thumbLayer.frame.insetBy(dx: -20, dy: -20).contains(startTouchPosition!){
            return true
        }else if dotIsUserInteractionEnabled {
            
            // 每个点的宽度
            let dotLen = trackHeight * 2
            // 点之间的间隔长度
            let len = (frame.width - dotLen * CGFloat(maxCount)) / CGFloat(maxCount - 1)
            let sliderFrame = Rect(trackHeight / 2.0, (frame.height - trackHeight) / 2.0, frame.width - trackHeight, trackHeight)
            
            // 点
            for i in 0..<maxCount {
                let x = (len + dotLen) * CGFloat(i)
                let dotFrame = Rect(x, sliderFrame.midY - trackHeight, dotLen, dotLen)
                
                if dotFrame.insetBy(dx: -10, dy: -10).contains(startTouchPosition!) {
                    
                    if i != index {
                        index = i
                        sendActions(for: .valueChanged)
                        
                        let size = thumbSize()
                        var minX = dotFrame.midX - size.width / 2.0
                        minX = fmax(minX, 0)
                        minX = fmin(minX, sliderFrame.maxX - size.width)
                        thumbLayer.frame = thumbLayer.frame.setMinX(minX)
                        
                    }
                    break
                }
            }
        }
        
        return false
    }
    
    override public func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        var posX = startThumbPosition!.x - (startTouchPosition!.x - touch.location(in: self).x)
        
        let size = thumbSize()
        posX = fmax(posX, 0)
        posX = fmin(posX, bounds.maxX - size.width)
        
        withoutCAAnimation {
            thumbLayer.frame = thumbLayer.frame.setMinX(posX)
            
        }
        
        return true
    }
    
    override public func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        endTouches()
    }
    
    override public func cancelTracking(with event: UIEvent?) {
        endTouches()
    }
    
    
    //MARK: - Private Methods
    fileprivate func endTouches() {
        
        // 点之间的间隔长度
        let len = frame.width / CGFloat(maxCount - 1)
        
        let idx = thumbLayer.position.x / len
        
        let i = lround(Double(idx))
        if i != index {
            index = UInt(i)
            sendActions(for: .valueChanged)
        }
        let size = thumbSize()
        thumbLayer.frame = thumbLayer.frame.setMinX(len * CGFloat(i) - size.width / 2.0)
        
    }
    
    /// 取消动画
    fileprivate func withoutCAAnimation(code: () -> Void) {
        CATransaction.begin()
        CATransaction.setValue(true, forKey: kCATransactionDisableActions)
        code()
        CATransaction.commit()
    }
    
    
    
}




