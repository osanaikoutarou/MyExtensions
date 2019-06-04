//
//  UIViewController+Utility.swift
//  EventWorks
//
//  Created by 長内幸太郎 on 2018/04/23.
//  Copyright © 2018年 osanai.sample.eventworks. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func isModal() -> Bool {
        if (self.presentingViewController != nil) {
//            return true
        }
        if (self.navigationController?.presentingViewController?.presentingViewController == self.navigationController) {
            return true
        }
        if (self.tabBarController?.presentingViewController is UITabBarController) {
            return true
        }
        return false
    }
}
