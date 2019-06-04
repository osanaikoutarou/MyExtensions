//
//  CastExtension.swift
//  EventWorks
//
//  Created by osanai on 2018/12/12.
//  Copyright © 2018年 osanai.sample.eventworks. All rights reserved.
//

import Foundation
import UIKit

// CGFloatへのキャストが煩雑すぎるため導入
// https://qiita.com/nakau1/items/bac828533c7db6eacf78

extension Int {
    public var f: CGFloat {
        return CGFloat(self)
    }
}
extension Float {
    public var f: CGFloat {
        return CGFloat(self)
    }
}
extension Double {
    public var f: CGFloat {
        return CGFloat(self)
    }
}
extension CGFloat {
    func ceilcgf() -> CGFloat {
        return CGFloat(ceilf(Float(self)))
    }
}
