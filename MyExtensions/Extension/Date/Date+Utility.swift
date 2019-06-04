//
//  Date+Utility.swift
//  EventWorks
//
//  Created by osanai on 2018/05/09.
//  Copyright © 2018年 osanai.sample.eventworks. All rights reserved.
//

import Foundation

extension Date {
    func toNSDate() -> NSDate {
        return NSDate.init(timeIntervalSince1970: self.timeIntervalSince1970)
    }
    
    // あと◯時間 など
    func leftBefore(toDate:Date) -> String {
        let sa = toDate.timeIntervalSince1970 - self.timeIntervalSince1970
        let sec = sa
        
        if (sa <= 0) {
            // 過ぎている
            return ""
        }
        
        if (sa < 60) {
            // 1分以内
            return String(sec) + "秒"
        }
        if (sa < 60 * 60 * 2) {
            // 120分以内
            let min = Int(sec/60) + 1
            return String(min) + "分"
        }
        if (sa < 60 * 60 * 24 * 1) {
            // 24時間以内
            let hour = Int(sec/(60*60)) + 1
            return String(hour) + "時間"
        }
        
        let day = Int(sec/(60*60*24))
        let hour:Int = Int((sec - Double(day * 60*60*24))/(60*60) + 1)
        return "\(day)日 \(hour)時間"
    }
}

extension Date {
    //TODO:正しいコードに修正する（Date絡みの話）
    
    // Date -> String  yyyy-MM-dd
    static func dateToString(_ date:Date?) -> String? {
        guard let date = date else {
            return nil
        }
        
        let dateFormater = ISO8601DateFormatter.init()
        return dateFormater.string(from: date)
    }
    // String -> Date  yyyy-MM-dd
    static func date(string:String) -> Date {
        let f = DateFormatter()
        f.dateFormat = "yyyy-MM-dd"
        f.locale = Locale(identifier: "ja_JP")
        return f.date(from: string)!
    }
    
    // Date -> String  yyyy-MM-dd HH:mm:ss
    static func dateTimeToString(_ date:Date?) -> String? {
        guard let date = date else {
            return nil
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        
        return dateFormatter.string(from: date)
    }
    
    // String -> Date  yyyy-MM-dd HH:mm:ss
    static func dateTime(string:String) -> Date {
        if let isoresult = ISO8601DateFormatter.init().date(from: string) {
            return isoresult
        }
        else {
            return Date()
        }
    }
}

//MARK:message(talk)

extension Date {
    static func dateTimeToStringMessage(date:Date?) -> String? {
        guard let date = date else {
            return nil
        }
        
        let dateFormater = DateFormatter()
        dateFormater.locale = Locale(identifier: "ja_JP")
        dateFormater.dateFormat = "MM/dd HH:mm"
        return dateFormater.string(from: date)
    }
    static func dateTimeToStringMessage(timeIntervalSince1970:TimeInterval) -> String? {
        let date = Date(timeIntervalSince1970: timeIntervalSince1970)
        
        let dateFormater = DateFormatter()
        dateFormater.locale = Locale(identifier: "ja_JP")
        dateFormater.dateFormat = "MM/dd HH:mm"
        return dateFormater.string(from: date)
    }
    static func dateTimeToStringMessageDate(date:Date?) -> String? {
        guard let date = date else {
            return nil
        }
        
        let dateFormater = DateFormatter()
        dateFormater.locale = Locale(identifier: "ja_JP")
        dateFormater.dateFormat = "MM/dd"
        return dateFormater.string(from: date)
    }

}

//MARK:WorkCell

extension Date {
    static func dateToStringJP(date:Date?) -> String? {
        guard let date = date else {
            return nil
        }
        
        let dateFormater = DateFormatter()
        dateFormater.locale = Locale(identifier: "ja_JP")
        dateFormater.dateFormat = "yyyy年M月d日"
        return dateFormater.string(from: date)
    }
    
    static func dateTimeToStringJP(date:Date?) -> String? {
        guard let date = date else {
            return nil
        }
        
        let dateFormater = DateFormatter()
        dateFormater.locale = Locale(identifier: "ja_JP")
        dateFormater.dateFormat = "yyyy年M月d日 HH時mm分"
        return dateFormater.string(from: date)
    }
}

//MARK: Utility

extension Date {
    func isLaterOrEqualThanOnlyDay(date:Date) -> Bool {
        // ちょっと位置情報が難しいので、一旦24時間分マイナスして対応
        return self.addingTimeInterval(3600) > date
    }
}
