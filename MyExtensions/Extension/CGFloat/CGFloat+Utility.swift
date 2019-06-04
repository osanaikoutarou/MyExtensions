//
//  CGFloat+Utility.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/01/26.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import Foundation
import UIKit

extension CGFloat {
    func minus(_ value:CGFloat) -> CGFloat {
        return self - value
    }
    func minus(_ value:Int) -> CGFloat {
        return self - value.f
    }
}
