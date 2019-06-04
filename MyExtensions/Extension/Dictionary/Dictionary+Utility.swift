//
//  Dictionary+Utility.swift
//  EventWorks
//
//  Created by 長内幸太郎 on 2018/12/02.
//  Copyright © 2018年 osanai.sample.eventworks. All rights reserved.
//

import Foundation

extension Dictionary where Key == String, Value == Any {
    mutating func safeEdit(key:String, value:Any?) {
        if let value = value {
            self[key] = value
        }
    }
    
    mutating func safeEdit(key:String, value:Any?, ignore:Bool) {
        if ignore {
            return
        }
        
        if let value = value {
            self[key] = value
        }
    }

}
