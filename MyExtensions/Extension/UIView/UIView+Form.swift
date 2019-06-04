//
//  UIView+Form.swift
//  EventWorks
//
//  Created by osanai on 2018/04/24.
//  Copyright © 2018年 osanai.sample.eventworks. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func circle() {
        self.layer.cornerRadius = min(self.frame.width,self.frame.height)/2.0
        self.clipsToBounds = true
    }
}
