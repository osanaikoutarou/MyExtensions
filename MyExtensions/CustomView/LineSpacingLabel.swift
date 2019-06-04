//
//  LineSpacingLabel.swift
//  Kenchikukatachi
//
//  Created by 長内幸太郎 on 2018/10/08.
//  Copyright © 2018年 長内幸太郎. All rights reserved.
//

import UIKit
import UIKit

class LineSpacingLabel: UILabel {

    @IBInspectable var lineSpace:CGFloat = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setLineSpace(lineSpace: lineSpace)
    }

    func setLineSpace(lineSpace:CGFloat) {
        self.lineSpace = lineSpace
        setLineSpacing(space: self.lineSpace)
    }
    
    override var text:String? {
        didSet {
            self.setLineSpacing(space: self.lineSpace)
        }
    }
    
    func setText(_ text:String, lineSpace:CGFloat) {
        self.text = text
        self.setLineSpacing(space: lineSpace)
    }
    
    fileprivate func setLineSpacing(space:CGFloat) {
        let attrString = NSMutableAttributedString(string: self.text!, attributes: [:])
        let style = NSMutableParagraphStyle()
        style.lineSpacing = space
        attrString.addAttribute(.paragraphStyle,
                                value: style,
                                range: NSMakeRange(0, attrString.length))
        self.attributedText = attrString
    }
    
//    /Users/osanaikoutarou/houseapp/Kenchikukatachi/<swift-imported-modules>:1:170: Module 'FirebaseCore' is defined in both '/Users/osanaikoutarou/Library/Developer/Xcode/DerivedData/ModuleCache.noindex/2QLGCM89ZNTIT/FirebaseCore-36JN783UV46CE.pcm' and '/Users/osanaikoutarou/Library/Developer/Xcode/DerivedData/ModuleCache.noindex/2QLGCM89ZNTIT/FirebaseCore-2H2S3JDHI0IY4.pcm'

}
