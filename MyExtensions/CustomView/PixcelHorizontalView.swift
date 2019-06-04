//
//  PixcelHorizontalView.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/02/02.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit

class PixcelHorizontalView: UIView {

    var line:UIView?
    var color:UIColor?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        color = self.backgroundColor
        self.backgroundColor = .clear
        
        update()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        update()
    }
    
    func update() {
        if let line = line {
            line.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: pxHeight)
        }
        else {
            line = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: pxHeight))
            if let line = line {
                line.backgroundColor = color
                addSubview(line)
            }
        }
    }
    
    var pxHeight:CGFloat {
        return 1.f/UIScreen.main.scale
    }

}
