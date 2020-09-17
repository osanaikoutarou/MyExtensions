//
//  UIScrollView+Utility.swift
//  EventWorks
//
//  Created by osanai on 2018/09/13.
//  Copyright © 2018年 osanai.sample.eventworks. All rights reserved.
//

import Foundation
import UIKit

extension UIScrollView {
    func isBottom(toleranceHeight:CGFloat) -> Bool {
        return contentOffset.y > contentSize.height - frame.height + contentInset.bottom - toleranceHeight
    }
    
    func isNeedScroll() -> Bool {
        return (contentSize.width > self.frame.width) ||
               (contentSize.height > self.frame.height)
    }
    
    func scrollToBottom(animation:Bool) {
        scrollToBottom(offset: 0, animation: animation)
    }
    func scrollToBottom(offset:CGFloat,animation:Bool) {
        UIView.animate(withDuration: animation ? 0.25 : 0) {
            self.contentOffset = CGPoint(x: self.contentOffset.x,
                                         y: self.contentSize.height - self.frame.size.height + self.contentInset.bottom + offset)
        }
    }
    
    // content insetは無視する
    var remaining:CGPoint {
        let horizontal = self.contentSize.width - self.frame.width - self.contentOffset.x
        let vertical = self.contentSize.height - self.frame.height - self.contentOffset.y
        return CGPoint(x: horizontal, y: vertical)
    }
}

extension UIScrollView {
    var isBoucing: Bool {
        return isBoucingTop || isBouncingBottom
    }
    // scroll上限より上にスクロールしている
    var isBoucingTop: Bool {
        return (contentOffset.y + contentInset.top < 0)
    }
    // scroll下限より下にスクロールしている
    var isBouncingBottom: Bool {
        return contentOffset.y > contentSize.height - bounds.height + contentInset.bottom
    }
    // 最大のContentOffset
    var maxContentOffset: CGPoint {
        return CGPoint(x: max(contentSize.width - bounds.width + contentInset.right, 0),
                       y: max(contentSize.height - bounds.height + contentInset.bottom, 0))
    }
}
