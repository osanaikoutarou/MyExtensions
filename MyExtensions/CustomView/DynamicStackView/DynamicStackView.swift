//
//  DynamicStackView.swift
//  DynamicStackView
//
//  Created by osanai on 2019/02/07.
//  Copyright © 2019年 osanai. All rights reserved.
//

import UIKit

class DynamicStackView: UIStackView {
    
    private var header: DynamicStackViewCell?
    private var footer: DynamicStackViewCell?
    var existHeader:Bool {
        return header != nil
    }
    var existFooter:Bool {
        return footer != nil
    }

    var cells:[DynamicStackViewCell] {
        return self.arrangedSubviews as! [DynamicStackViewCell]
    }
    var cellsCountWithoutHeaderFooter:Int {
        return cells.count - (existHeader ? 1 : 0) - (existFooter ? 1 : 0)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
//        removeAll()
        if cells.count > 0 , let cell = cells.first , cell.isHeader {
            self.header = cell
        }
        if cells.count > 0 , let cell = cells.last , cell.isFooter {
            self.footer = cell
        }
    }
    
    // Add
    func addCell(cell:DynamicStackViewCell) {
        insertLastCell(cell: cell)
    }
    // Insert
    func insertCell(cell:DynamicStackViewCell, at index:Int) {
        let offset = existHeader ? 1 : 0
        insertArrangedSubview(cell, at: index + offset)
    }
    func insertLastCell(cell:DynamicStackViewCell) {
        let offset = existFooter ? 1 : 0
        insertArrangedSubview(cell, at: cells.count - offset)
    }
    // Remove
    private func remove(index:Int) {
        if cells.count > index {
            let cell = cells[index]
            self.removeArrangedSubview(cell)
            cell.removeFromSuperview()
        }
    }
    func removeCell(index:Int) {
        let offset = existHeader ? 1 : 0
        remove(index: index + offset)
    }
    func removeCell(cell:DynamicStackViewCell) {
        if cells.index(of: cell) != nil {
            self.removeArrangedSubview(cell)
            cell.removeFromSuperview()
        }
    }
    func removeLastCell() {
        if cellsCountWithoutHeaderFooter < 1 {
            return
        }
        let offset = existFooter ? 1 : 0
        remove(index: cells.count - 1 - offset)
    }
    func removeAllCells() {
        for i in (existHeader ? 1 : 0)..<cellsCountWithoutHeaderFooter {
            removeCell(index: i)
        }
    }
    func removeAll() {
        self.arrangedSubviews.forEach {
            self.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
    }
    // Index
    func indexes(of cell:DynamicStackViewCell) -> [Int] {
        let equalCells = cells.filter { $0 == cell }
        let indexes = equalCells.map { cells.index(of: $0)! }
        return indexes
    }
    func index(of cell:DynamicStackViewCell) -> Int? {
        return indexes(of: cell).first
    }
    // header/footer
    func addHeader(header:DynamicStackViewCell) {
        insertCell(cell: header, at: 0)
        self.header = header
    }
    func removeHeader() {
        if existHeader {
            removeCell(index: 0)
            header = nil
        }
    }
    func addFooter(footer:DynamicStackViewCell) {
        removeFooter()
        addCell(cell: footer)
        self.footer = footer
    }
    func removeFooter() {
        if existFooter {
            removeLastCell()
            footer = nil
        }
    }
    // hide/show
    func hideCellsTo(num:Int, animationDuration:CGFloat) {
        if self.cells.count < num {
            return
        }
        
        UIView.animate(withDuration: TimeInterval(animationDuration)) {
            for i in num..<self.cells.count {
                self.cells[i].isHidden = true
            }
        }
    }
    func showAllCell(animationDuration:CGFloat) {
        UIView.animate(withDuration: TimeInterval(animationDuration)) {
            self.cells.forEach { $0.isHidden = false }
            self.layoutIfNeeded()
        }
    }

    
}

extension DynamicStackView {
    func cell(with identifier:String) -> DynamicStackViewCell? {
        return cells.first { $0.identifier == identifier }
    }
}
