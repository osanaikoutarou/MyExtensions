//
//  UINavigationController+Color.swift
//  EventWorks
//
//  Created by 長内幸太郎 on 2018/10/23.
//  Copyright © 2018年 osanai.sample.eventworks. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    func changeTitleColor(color:UIColor) {
        let textAttributes = [NSAttributedString.Key.foregroundColor:color]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
}
