//
//  NoPaddingTextView.swift
//  ReeachA
//
//  Created by osanai on 2019/01/28.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit

@IBDesignable class NoPaddingTextView: UITextView {
    override func layoutSubviews() {
        super.layoutSubviews()
        removePadding()
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        removePadding()
    }
}
