//
//  UIControl+Action.swift
//  EventWorks
//
//  Created by osanai on 2018/04/19.
//  Copyright © 2018年 osanai.sample.eventworks. All rights reserved.
//

import Foundation
import UIKit

class ClosureSleeve {
    let closure: (() -> Void)
    
    init (_ closure: @escaping (() -> Void)) {
        self.closure = closure
    }
    
    @objc func invoke () {
        closure()
    }
}

extension UIControl {
    func addAction (for controlEvents: UIControl.Event, _ closure: @escaping (() -> Void)) {
        let sleeve = ClosureSleeve(closure)
        addTarget(sleeve, action: #selector(ClosureSleeve.invoke), for: controlEvents)
        objc_setAssociatedObject(self, String(format: "[%d]", arc4random()), sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
}
