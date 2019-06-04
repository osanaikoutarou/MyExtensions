//
//  Int+Utility.swift
//  EventWorks
//
//  Created by 長内幸太郎 on 2018/07/12.
//  Copyright © 2018年 osanai.sample.eventworks. All rights reserved.
//

import Foundation

extension Int {
    
    func yen() -> String {
        return "¥ " + self.addComma()
    }
    
    func addComma() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        formatter.groupingSeparator = ","
        formatter.groupingSize = 3
        return formatter.string(from: NSNumber(value: self))!
    }
}
