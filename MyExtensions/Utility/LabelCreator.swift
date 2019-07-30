//
//  LabelCreator.swift
//  MyExtensions
//
//  Created by 長内幸太郎 on 2019/07/15.
//  Copyright © 2019 osanai. All rights reserved.
//

import UIKit

class LabelCreator: NSObject {
    struct LabelComponent {
        let text: String
        let font: UIFont
        let textColor: UIColor
    }

    static func create(with components:[LabelComponent]) -> NSMutableAttributedString {
        let text = components.map { $0.text }.joined()
        let attr = NSMutableAttributedString(string: text)

        var location = 0
        components.forEach { (component) in
            attr.addAttributes([.font : component.font,
                                .foregroundColor : component.textColor],
                               range: NSRange(location: location, length: component.text.count))
            location += component.text.count
        }

        return attr
    }
}
