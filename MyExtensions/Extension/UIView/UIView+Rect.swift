//
//  UIView+Rect.swift
//  MyExtensions
//
//  Created by 長内幸太郎 on 2019/12/10.
//  Copyright © 2019 osanai. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    /// selfの座標系に対して、otherViewのframeとの被る部分を返す
    func intersectionFrames(otherView: UIView) -> CGRect? {
        print(otherView.frame)
        guard let otherViewSuperView = otherView.superview,
            let selfSuperView = self.superview else {
                return nil
        }
        
        let rect = otherViewSuperView.convert(otherView.frame, to: selfSuperView)
        return self.frame.intersection(rect)
    }
}
