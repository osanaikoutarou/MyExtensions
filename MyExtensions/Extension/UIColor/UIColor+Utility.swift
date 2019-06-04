//
//  UIColor+Utility.swift
//  EventWorks
//
//  Created by osanai on 2018/10/24.
//  Copyright © 2018年 osanai.sample.eventworks. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    func whitlyColor(degree:CGFloat) -> UIColor {
        return UIColor(
            red:   (1.0 - self.red()) * degree + self.red(),
            green: (1.0 - self.green()) * degree + self.green(),
            blue:  (1.0 - self.blue()) * degree + self.blue(),
            alpha: alphaColor())
    }
    
    
    
    
    
}

extension UIColor {
    func convertToRGBA() -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        let components = cgColor.components!
        return (red: components[0], green: components[1], blue: components[2], alpha: components[3])
    }
    func red() -> CGFloat {
        return convertToRGBA().red
    }
    func green() -> CGFloat {
        return convertToRGBA().green
    }
    func blue() -> CGFloat {
        return convertToRGBA().blue
    }
    func alphaColor() -> CGFloat {
        return convertToRGBA().alpha
    }
}
