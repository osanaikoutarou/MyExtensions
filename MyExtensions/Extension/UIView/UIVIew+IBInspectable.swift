//
//  UIVIew+IBInspectable.swift
//  WeekCalendarExample
//
//  Created by osanai on 2019/05/29.
//  Copyright © 2019 osanai. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

    @IBInspectable
    var cornerRadius_: CGFloat {
        set {
            self.layer.cornerRadius = newValue
        }
        get {
            return self.layer.cornerRadius
        }
    }

    @IBInspectable
    var borderWidth_: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable
    var borderColor_: UIColor? {
        set {
            layer.borderColor = newValue?.cgColor
        }
        get {
            let color = UIColor(cgColor: layer.borderColor!)
            return color
        }
    }

}
