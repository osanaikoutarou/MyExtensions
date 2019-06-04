//
//  UIViewController+ActionSheet.swift
//  ReeachA
//
//  Created by osanai on 2019/01/28.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertAction {
    static func initalize(title: String?, style: UIAlertAction.Style, handler: ((UIAlertAction) -> Void)? = nil, icon:UIImage?) -> UIAlertAction {
        let alertAction = UIAlertAction(title: title, style: style, handler: handler)
        
        if let icon = icon {
            
            alertAction.setValue(icon.withRenderingMode(.alwaysOriginal), forKey: "image")
            alertAction.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
        }
        
        return alertAction
    }
    
    func alignLeft() -> UIAlertAction {
        self.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
        return self
    }
}

extension UIViewController {
    
    func dispActionSheet(message:String, okAction:@escaping AlertActioinClosure) {
        let actionSheet = UIAlertController(title: nil, message: message, preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "OK", style: .default, handler: okAction))
        self.present(actionSheet, animated: true, completion: {
        })
    }
    
    func dispActionSheet(title:String?, message:String?, actions:[UIAlertAction]) {
        let actionSheet = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        actions.forEach { (action) in
            actionSheet.addAction(action)
        }
        self.present(actionSheet, animated: true, completion: {
        })
    }
    
//    func dispAlert(message:String,
//                   okAction: @escaping AlertActioinClosure,
//                   cancelAction: @escaping AlertActioinClosure) {
//
//        let alert = UIAlertController.init(title: nil, message: message, preferredStyle: .alert)
//        let okAction: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: okAction)
//        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: .cancel, handler: cancelAction)
//        alert.addAction(okAction)
//        alert.addAction(cancelAction)
//        self.present(alert, animated: true)
//    }
}

