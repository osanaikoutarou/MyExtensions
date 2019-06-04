//
//  UIScreen+Utility.swift
//  EventWorks
//
//  Created by 長内幸太郎 on 2018/04/24.
//  Copyright © 2018年 osanai.sample.eventworks. All rights reserved.
//

import Foundation
import UIKit

extension UIScreen {
    static func px() -> CGFloat {
        return 1.0/self.main.scale;
    }
    
    static func safeAreaInsets() -> UIEdgeInsets {
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.keyWindow
            if let window = window {
                return window.safeAreaInsets
            }
        }
        return .zero
    }
    
    static func bottomSafearea() -> CGFloat {
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.keyWindow
            if let window = window {
                return window.safeAreaInsets.bottom
            }
        }
        return 0
    }
    
    static func isShortScreen() -> Bool {
        // 縦/横が1.5以下 iPhone4s,iPadなど
        return main.bounds.height/main.bounds.width <= 1.5
    }
    static func isLongScreen() -> Bool {
        // 縦/横が1.7以上　iPhoneX系
        return main.bounds.height/main.bounds.width >= 2.0
    }
}
