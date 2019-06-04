//
//  UIView+Fade.swift
//  EventWorks
//
//  Created by 長内幸太郎 on 2018/11/25.
//  Copyright © 2018年 osanai.sample.eventworks. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func fadein(duration:TimeInterval) {
        self.isHidden = false
        UIView.animate(withDuration: duration) {
            self.alpha = 1.0
        }
    }
    func fadeout(duration:TimeInterval) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0
        }) { (finihed) in
            self.isHidden = true
        }
    }
}
