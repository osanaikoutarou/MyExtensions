//
//  UIStoryboardSegue+Utility.swift
//  EventWorks
//
//  Created by osanai on 2018/07/24.
//  Copyright © 2018年 osanai.sample.eventworks. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboardSegue {
    var destinationInUINav : UIViewController {
        return (destination as! UINavigationController).topViewController!
    }
}
