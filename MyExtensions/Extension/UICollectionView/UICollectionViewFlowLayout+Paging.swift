//
//  UICollectionViewFlowLayout+Paging.swift
//  WeekCalendarExample
//
//  Created by osanai on 2019/05/28.
//  Copyright © 2019 osanai. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionViewFlowLayout {

    // MARK: - Horizontal

    /// 左端にあわせる（共通）
    func cellLeftTargetContentOffset(proposedContentOffset: CGPoint,
                                     velocity: CGPoint,
                                     leftInset: CGFloat,
                                     rightInset: CGFloat,
                                     pageWidth: CGFloat? = nil) -> CGPoint {

        let targetRect = CGRect(origin: CGPoint(x: proposedContentOffset.x, y: 0), size: self.collectionView!.bounds.size)

        // CollectionViewに表示されているcell群のレイアウト情報
        let cellLayoutArray = layoutAttributesForElements(in: targetRect)

        // 最も近いcellに対してAdjustmentをセットする
        var offsetAdjustment = CGFloat.greatestFiniteMagnitude
        let horizontalOffset = proposedContentOffset.x + leftInset
        cellLayoutArray?.forEach({ (layoutAttributes: UICollectionViewLayoutAttributes) in
            let itemOffset = layoutAttributes.frame.origin.x
            if abs(itemOffset - horizontalOffset) < abs(offsetAdjustment) {
                offsetAdjustment = itemOffset - horizontalOffset
            }
        })

        // 最後のcell対応
        if self.collectionViewContentSize.width - targetRect.width - self.itemSize.width / 2.0 < proposedContentOffset.x {
            let targetX = self.collectionViewContentSize.width - targetRect.width + rightInset
            offsetAdjustment = targetX - proposedContentOffset.x
        }

        var result = proposedContentOffset
        result.x += offsetAdjustment

        print(result.x)

        return result
    }

    /// 左端にあわせる2（共通）
    func cellLeftTargetContentOffset2(proposedContentOffset: CGPoint,
                                      velocity: CGPoint,
                                      leftInset: CGFloat,
                                      rightInset: CGFloat) -> CGPoint {

        guard let collectionView = collectionView else {
            return proposedContentOffset
        }

        let pageWidth = collectionView.frame.width

        // 指を離したタイミングでのページ番号
        let currentPage = collectionView.contentOffset.x / pageWidth

        if abs(velocity.x) > 0.2 {
            // velocity.x が閾値より大きい場合 (アイテムを左右にフリックした場合)

            // velocity.x が正の場合は、currentPage を切り上げた値を「スクロール先のページ番号」とする (負の場合はその逆)
            let nextPage = velocity.x > 0 ? ceil(currentPage) : floor(currentPage)

            // 「スクロール先のページ番号」と「ページ幅」を掛けて contentOffset.x を計算する
            // contentOffset.y は proposedContentOffset.y をそのまま設定
            return CGPoint(x: nextPage * pageWidth, y: proposedContentOffset.y)
        }
        else {
            // velocity.x が閾値以下の場合 (アイテムをドラッグした後に指を離した場合)

            // currentPage を四捨五入して「スクロール先のページ番号」とする
            // contentOffset は「velocity.x が閾値より大きい場合」と同様に計算
            return CGPoint(x: round(currentPage) * pageWidth, y: proposedContentOffset.y)
        }




//        let targetRect = CGRect(origin: CGPoint(x: proposedContentOffset.x, y: 0), size: self.collectionView!.bounds.size)
//
//        // CollectionViewに表示されているcell群のレイアウト情報
//        let cellLayoutArray = layoutAttributesForElements(in: targetRect)
//
//        // 最も近いcellに対してAdjustmentをセットする
//        var offsetAdjustment = CGFloat.greatestFiniteMagnitude
//        let horizontalOffset = proposedContentOffset.x + leftInset
//        cellLayoutArray?.forEach({ (layoutAttributes: UICollectionViewLayoutAttributes) in
//            let itemOffset = layoutAttributes.frame.origin.x
//            if abs(itemOffset - horizontalOffset) < abs(offsetAdjustment) {
//                offsetAdjustment = itemOffset - horizontalOffset
//            }
//        })
//
//        // 最後のcell対応
//        if self.collectionViewContentSize.width - targetRect.width - self.itemSize.width / 2.0 < proposedContentOffset.x {
//            let targetX = self.collectionViewContentSize.width - targetRect.width + rightInset
//            offsetAdjustment = targetX - proposedContentOffset.x
//        }
//
//        var result = proposedContentOffset
//        result.x += offsetAdjustment
//
//        print(result.x)
//
//        return result
    }


    /// センターに合わせる
    func cellHorizontalCenterTargetContentOffset(proposedContentOffset: CGPoint, velocity: CGPoint) -> CGPoint {

        // 🤔
        // 未検証だけど、セルの幅がでかい時はこっちのほうが自然
        // セルのサイズが1/3とか1/4になると、下の方の処理のほうが自然
        // leftに合わせるのも、同様かな
        guard let collectionView = collectionView else {
            return proposedContentOffset
        }

        let pageWidth = itemSize.width

        // 指を離したタイミングでのページ番号
        let currentPage = collectionView.contentOffset.x / pageWidth

        if abs(velocity.x) > 0.2 {
            // velocity.x が閾値より大きい場合 (アイテムを左右にフリックした場合)

            // velocity.x が正の場合は、currentPage を切り上げた値を「スクロール先のページ番号」とする (負の場合はその逆)
            let nextPage = velocity.x > 0 ? ceil(currentPage) : floor(currentPage)

            // 「スクロール先のページ番号」と「ページ幅」を掛けて contentOffset.x を計算する
            // contentOffset.y は proposedContentOffset.y をそのまま設定
            return CGPoint(x: nextPage * pageWidth, y: proposedContentOffset.y)
        }
        else {
            // velocity.x が閾値以下の場合 (アイテムをドラッグした後に指を離した場合)

            // currentPage を四捨五入して「スクロール先のページ番号」とする
            // contentOffset は「velocity.x が閾値より大きい場合」と同様に計算
            return CGPoint(x: round(currentPage) * pageWidth, y: proposedContentOffset.y)
        }






//        print(velocity)
//
//        guard let collectionView = collectionView else {
//            return .zero
//        }
//
//        let targetRect = CGRect(origin: CGPoint(x: proposedContentOffset.x, y: 0), size: self.collectionView!.bounds.size)
//
//        // CollectionViewに表示されているcell群のレイアウト情報
//        let cellLayoutArray = layoutAttributesForElements(in: targetRect)
//
//        // 最も近いcellに対してAdjustmentをセットする
//        var offsetAdjustment = CGFloat.greatestFiniteMagnitude
//        let horizontalOffset = proposedContentOffset.x + (collectionView.frame.width - itemSize.width)/2.0
//        print("proposedContentOffset \(proposedContentOffset.x)")
//        print("horizontalOffset \(horizontalOffset)")
//        cellLayoutArray?.forEach({ (layoutAttributes: UICollectionViewLayoutAttributes) in
//            let itemOffset = layoutAttributes.frame.origin.x
//            if abs(itemOffset - horizontalOffset) < abs(offsetAdjustment) {
//                offsetAdjustment = itemOffset - horizontalOffset
//            }
//        })
//
//        var expectedX = proposedContentOffset.x + offsetAdjustment
//
//        // 右端、左端処理
//        if proposedContentOffset.x <= -collectionView.contentInset.left {
//            expectedX = -collectionView.contentInset.left
//        }
//        if proposedContentOffset.x >= collectionView.contentSize.width + collectionView.contentInset.right - collectionView.frame.width {
//            expectedX = collectionView.contentSize.width + collectionView.contentInset.right - collectionView.frame.width
//        }
//
//        print(expectedX)
//
//        return CGPoint(x: expectedX, y: proposedContentOffset.y)
    }

    // MARK: - Vertical

    /// 上端にあわせる（共通）
    func cellTopTargetContenetOffset(proposedContentOffset: CGPoint,
                                     velocity: CGPoint,
                                     topInset: CGFloat,
                                     bottomInset: CGFloat) -> CGPoint {

        guard let collectionView = collectionView else {
            return .zero
        }

        let targetRect = CGRect(origin: CGPoint(x: 0, y: proposedContentOffset.y), size: collectionView.bounds.size)

        // CollectionViewに表示されているcell群のレイアウト情報
        let cellLayoutArray = layoutAttributesForElements(in: targetRect)

        // 最も近いcellに対してAdjustmentをセットする
        var offsetAdjustment = CGFloat.greatestFiniteMagnitude
        let verticalOffset = proposedContentOffset.y + topInset
        cellLayoutArray?.forEach({ (layoutAttributes: UICollectionViewLayoutAttributes) in
            let itemOffset = layoutAttributes.frame.origin.y
            if abs(itemOffset - verticalOffset) < abs(offsetAdjustment) {
                offsetAdjustment = itemOffset - verticalOffset
            }
        })

        // 最後のcell対応
        if self.collectionViewContentSize.height - targetRect.height - self.itemSize.height / 2.0 < proposedContentOffset.y {
            let targetY = self.collectionViewContentSize.height - targetRect.height + bottomInset
            offsetAdjustment = targetY - proposedContentOffset.y
        }

        var result = proposedContentOffset
        result.y += offsetAdjustment

        return result
    }

    /// センターに合わせる
    func cellVerticalCenterTargetContentOffset(proposedContentOffset: CGPoint, velocity: CGPoint) -> CGPoint {

        guard let collectionView = collectionView else {
            return .zero
        }

        let targetRect = CGRect(origin: CGPoint(x: 0, y: proposedContentOffset.y), size: self.collectionView!.bounds.size)

        // CollectionViewに表示されているcell群のレイアウト情報
        let cellLayoutArray = layoutAttributesForElements(in: targetRect)

        // 最も近いcellに対してAdjustmentをセットする
        var offsetAdjustment = CGFloat.greatestFiniteMagnitude
        let verticalOffset = proposedContentOffset.y + (collectionView.frame.height - itemSize.height)/2.0
        cellLayoutArray?.forEach({ (layoutAttributes: UICollectionViewLayoutAttributes) in
            let itemOffset = layoutAttributes.frame.origin.y
            if abs(itemOffset - verticalOffset) < abs(offsetAdjustment) {
                offsetAdjustment = itemOffset - verticalOffset
            }
        })

        var expectedY = proposedContentOffset.y + offsetAdjustment

        // 上端、下端
        if proposedContentOffset.y <= -collectionView.contentInset.top {
            expectedY = -collectionView.contentInset.top
        }
        if proposedContentOffset.y >= collectionView.contentSize.height + collectionView.contentInset.bottom - collectionView.frame.height {
            expectedY = collectionView.contentSize.height + collectionView.contentInset.bottom - collectionView.frame.height
        }

        return CGPoint(x: proposedContentOffset.x, y: expectedY)
    }
}
