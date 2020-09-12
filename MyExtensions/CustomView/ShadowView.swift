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
        layer.cornerRadius = cornerRadius                  // 影
        layer.shadowColor = shadowColor.cgColor            // 影の色
        layer.shadowOpacity = shadowOpacity                // 影の透明度
        layer.shadowOffset = shadowOffset                  // 影の位置
        layer.shadowRadius = shadowRadius                  // 影の半径
        layer.masksToBounds = false                        //
        layer.shouldRasterize = true                       //
        layer.rasterizationScale = UIScreen.main.scale     //
        
        self.cornerRadiusSave = cornerRadius
    }
    
    func addShadowExample() {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = shadowOpacity                // 影の透明度
        view.layer.shadowOffset = shadowOffset                  // 影の位置
        view.layer.shadowRadius = shadowRadius                  // 影の半径
        view.layer.masksToBounds = false                        //
        view.layer.shouldRasterize = true                       //
        view.layer.rasterizationScale = UIScreen.main.scale
    }
}
