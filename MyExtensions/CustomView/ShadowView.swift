//
//  ShadowView.swift
//  EventWorks
//
//  Created by osanai on 2018/04/25.
//  Copyright © 2018年 osanai.sample.eventworks. All rights reserved.
//

import UIKit

class ShadowView: UIView {

    var cornerRadiusSave: CGFloat = 0
    
    override var bounds: CGRect {
        didSet {
            layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
        }
    }
    
    func addShadow(shadowColor:UIColor,
                   shadowOffset:CGSize,
                   shadowOpacity:Float,
                   shadowRadius:CGFloat,
                   cornerRadius:CGFloat) {
        
        backgroundColor = .white
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
        layer.masksToBounds = false
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        
        self.cornerRadiusSave = cornerRadius
    }
}
