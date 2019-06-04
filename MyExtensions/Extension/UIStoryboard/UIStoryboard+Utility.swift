//
//  UIStoryboard+Utility.swift
//  EventWorks
//
//  Created by 長内幸太郎 on 2018/11/18.
//  Copyright © 2018年 osanai.sample.eventworks. All rights reserved.
//

import Foundation
import UIKit

enum StoryboardType {
    case tutorial
}

extension UIStoryboard {
    
    static func storyboard(type:StoryboardType) -> UIStoryboard? {
        if type == .tutorial {
            if UIScreen.isShortScreen() {
                return UIStoryboard(name: "TutorialShort", bundle: nil)
            }
            if UIScreen.isLongScreen() {
                return UIStoryboard(name: "TutorialLong", bundle: nil)
            }
            return UIStoryboard(name: "Tutorial", bundle: nil)
        }
        return nil
    }
}
