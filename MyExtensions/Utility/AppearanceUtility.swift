//
//  AppearanceUtility.swift
//  MyExtensions
//
//  Created by 長内幸太郎 on 2020/09/16.
//  Copyright © 2020 osanai. All rights reserved.
//

import Foundation
import UIKit

class AppearanceUtility {
    
    static func setupNavigationBarColors() {
        UINavigationBar.appearance().tintColor = .black
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().isTranslucent = false
        UITabBar.appearance().tintColor = .orange
    }
    
    /// Navigation Backボタンのタイトルを消す
    static func removeBackButtonTitle() {
        let attributes = [NSAttributedString.Key.font:  UIFont(name: "Helvetica-Bold", size: 0.1)!, NSAttributedString.Key.foregroundColor: UIColor.clear]
        UIBarButtonItem.appearance().setTitleTextAttributes(attributes, for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes(attributes, for: .highlighted)
    }
    
    
    
}
