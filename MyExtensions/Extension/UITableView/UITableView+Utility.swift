//
//  UITableView+Utility.swift
//  EventWorks
//
//  Created by 長内幸太郎 on 2018/09/18.
//  Copyright © 2018年 osanai.sample.eventworks. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func lastIndexPath() -> IndexPath {
        return IndexPath(row: self.numberOfRows(inSection: self.numberOfSections - 1) - 1,
                         section: self.numberOfSections - 1)
    }
    
    func reloadRow(at: IndexPath, with: UITableView.RowAnimation) {
        self.reloadRows(at: [at], with: with)
    }
}
