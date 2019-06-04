//
//  UIView+Corner.swift
//  EventWorks
//
//  Created by osanai on 2018/04/24.
//  Copyright © 2018年 osanai.sample.eventworks. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func corner(radius:CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
}
