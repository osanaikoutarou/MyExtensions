//
//  UITextView+Utility.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/01/26.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import Foundation
import UIKit

extension UITextView {
    func removePadding() {
        textContainerInset = .zero
        textContainer.lineFragmentPadding = 0.0
    }
}
