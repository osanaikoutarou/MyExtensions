//
//  UIEdgeInsets+Utility.swift
//  MyExtensions
//
//  Created by 長内幸太郎 on 2020/09/18.
//  Copyright © 2020 osanai. All rights reserved.
//

import Foundation
import UIKit

extension UIEdgeInsets {
    func setTop(_ value: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: value, left: left, bottom: bottom, right: right)
    }
    func setLeft(_ value: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: top, left: value, bottom: bottom, right: right)
    }
    func setRight(_ value: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: top, left: left, bottom: bottom, right: value)
    }
    func setBottom(_ value: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: top, left: left, bottom: value, right: right)
    }
}
