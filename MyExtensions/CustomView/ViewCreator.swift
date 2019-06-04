//
//  ViewCreator.swift
//  EventWorks
//
//  Created by 長内幸太郎 on 2018/04/12.
//  Copyright © 2018年 osanai.sample.eventworks. All rights reserved.
//

import UIKit

class ViewCreator: NSObject {

    static func coloredView(color:UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        return view
    }
    
}
