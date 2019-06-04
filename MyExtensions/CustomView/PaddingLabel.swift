//
//  PaddingLabel.swift
//  EventWorks
//
//  Created by osanai on 2018/05/30.
//  Copyright © 2018年 osanai.sample.eventworks. All rights reserved.
//

import UIKit

class PaddingLabel: UILabel {
    
    @IBInspectable var padding: UIEdgeInsets = UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)
    
    override func drawText(in rect: CGRect) {
        let newRect = rect.inset(by: padding)
        super.drawText(in: newRect)
    }
    
    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += padding.top + padding.bottom
        contentSize.width += padding.left + padding.right
        return contentSize
    }
    
}

