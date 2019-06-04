//
//  CornerRaoundButtonView.swift
//  ReeachA
//
//  Created by osanai on 2019/01/28.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit

@IBDesignable
class CornerRaoundButtonView: ButtonView {
    
    @IBInspectable var borderWidth:CGFloat = 1.f
    @IBInspectable var borderColor:UIColor = UIColor(white: 51.0/255.0, alpha: 1)

//    override func draw(_ rect: CGRect) {
//        update()
//    }
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        update()
//    }
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        update()
//    }
//    override func prepareForInterfaceBuilder() {
//        update()
//    }
    override func layoutSubviews() {
        super.layoutSubviews()
        update()
    }
    @IBInspectable var rounded: Bool = true {
        didSet {
            update()
        }
    }

    func update() {
        self.clipsToBounds = true
        layer.cornerRadius = rounded ? min(frame.height, frame.width) / 2 : 0
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
}
