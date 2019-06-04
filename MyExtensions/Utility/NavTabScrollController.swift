//
//  NavTabScrollController.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/01/27.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit

class NavTabScrollController: NSObject {

    let offset = 60.f
    var enable:Bool = false
    var start:CGPoint = .zero
    var didUp:(() -> Void)?
    var didDown:(() -> Void)?
    
    func startScrolling(offset:CGPoint) {
        enable = true
        start = offset
    }
    func endScrolling() {
        enable = false
        start = .zero
    }
    func scrollViewdidScroll(scrollView:UIScrollView) {
        if !enable {
            return
        }
        
        if scrollView.contentOffset.y > start.y + offset {
            didDown?()
        }
        if scrollView.contentOffset.y < start.y - offset {
            didUp?()
        }
    }
    
}
