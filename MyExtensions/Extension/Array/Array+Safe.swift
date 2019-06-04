//
//  Array+Safe.swift
//  EventWorks
//
//  Created by osanai on 2018/04/23.
//  Copyright © 2018年 osanai.sample.eventworks. All rights reserved.
//

import Foundation

extension Array {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
