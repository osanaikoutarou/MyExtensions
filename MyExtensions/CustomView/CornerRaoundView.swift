//
//  CornerRaoundView.swift
//  URAKATA
//
//  Created by 長内幸太郎 on 2019/01/13.
//  Copyright © 2019年 osanai.sample.eventworks. All rights reserved.
//

import UIKit

@IBDesignable class CornerRaoundView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        updateCornerRadius()
    }
    @IBInspectable var rounded: Bool = false {
        didSet {
            updateCornerRadius()
        }
    }
    
    func updateCornerRadius() {
        layer.cornerRadius = rounded ? min(frame.height, frame.width) / 2 : 0
    }
}
