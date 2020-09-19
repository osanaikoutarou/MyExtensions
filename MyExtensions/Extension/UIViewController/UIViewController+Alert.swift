//
//  UIViewController+Alert.swift
//  EventWorks
//
//  Created by osanai on 2018/06/18.
//  Copyright © 2018年 osanai.sample.eventworks. All rights reserved.
//

import Foundation
import UIKit

typealias AlertActioinClosure = ((UIAlertAction) -> Void)

extension UIViewController {
    
    func dispAlert(message:String,okAction:@escaping AlertActioinClosure) {
        let alert = UIAlertController.init(title: nil, message: message, preferredStyle: .alert)
        let okAction: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: okAction)
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
    
    func dispAlert(message:String,
                   okAction: @escaping AlertActioinClosure,
                   cancelAction: @escaping AlertActioinClosure) {
        
        let alert = UIAlertController.init(title: nil, message: message, preferredStyle: .alert)
        let okAction: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: okAction)
        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: .cancel, handler: cancelAction)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true)
    }
}

// debug用
extension UIViewController {
    
    func dispAlertForDebug(message:String,okAction:@escaping AlertActioinClosure) {
        return dispAlert(message: message, okAction: okAction)
    }
}
