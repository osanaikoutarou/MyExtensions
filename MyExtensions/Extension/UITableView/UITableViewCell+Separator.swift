//
//  UITableViewCell+Separator.swift
//  MyExtensions
//
//  Created by osanai on 2019/09/03.
//  Copyright © 2019 osanai. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {

    /// 下部のSeparatorを消す
    func clearSeparator() {
        separatorInset = UIEdgeInsets(top: 0, left: CGFloat.greatestFiniteMagnitude, bottom: 0, right: 0)
    }

    /// 下部のSeparatorのInsetを消す
    func fullSeparator() {
        separatorInset = .zero
    }
}
