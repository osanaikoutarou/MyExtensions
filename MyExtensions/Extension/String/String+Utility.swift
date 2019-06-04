//
//  String+Utility.swift
//  EventWorks
//
//  Created by osanai on 2018/06/25.
//  Copyright © 2018年 osanai.sample.eventworks. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func addComma() -> String {
        let num = Int(self)
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        formatter.groupingSeparator = ","
        formatter.groupingSize = 3
        return formatter.string(from: NSNumber(value:num!))!
    }
    
    init(string:String?, emptyText:String) {
        if let string = string {
            if string.isEmpty {
                self = emptyText
            }
            else {
                self = string
            }
        }
        else {
            self = emptyText
        }
    }
    
    func emptyText(text:String) -> String{
        if (self.isEmpty) {
            return text
        }
        else {
            return self
        }
    }
    
    static func isEmpty(string:String?) -> Bool {
        guard let string = string else {
            return true
        }
        return string.isEmpty
    }
    
    var isNotEmpty: Bool {
        return !isEmpty
    }
 
}

/// height
extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [ .font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
}

/// String?
extension Optional where Wrapped == String {
    
    func emptyText(text:String) -> String {
        if let s = self {
            return s.emptyText(text: text)
        }
        else {
            return text
        }
    }
    
}
