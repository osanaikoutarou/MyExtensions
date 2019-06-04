//
//  CGSize+Utility.swift
//  EventWorks
//
//  Created by osanai on 2018/10/23.
//  Copyright © 2018年 osanai.sample.eventworks. All rights reserved.
//

import Foundation
import UIKit

extension CGSize {
    static func pxSize() -> CGSize {
        return CGSize(width: 1, height: 1)
    }
    
    func scale(_ scale:CGFloat) -> CGSize {
        return CGSize(width: width * scale, height: height * scale)
    }
}
