//
//  UIView+Gesture.swift
//  EventWorks
//
//  Created by 長内幸太郎 on 2018/09/25.
//  Copyright © 2018年 osanai.sample.eventworks. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func addTap(target: Any?, action: Selector?) {
        let tap = UITapGestureRecognizer(target: target, action: action)
        tap.cancelsTouchesInView = false
        self.addGestureRecognizer(tap)
    }

}
