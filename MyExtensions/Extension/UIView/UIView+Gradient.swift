//
//  UIView+Gradient.swift
//  MyExtensions
//
//  Created by 長内幸太郎 on 2019/07/30.
//  Copyright © 2019 osanai. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

    /// 赤系から青系へのグラデーション
    @discardableResult
    func gradientBackground(direction: GradientDirection) -> UIView {

        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]

        switch direction {
        case .horizontal:
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0)
        case .vertical:
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0, y: 1.0)
        }

        layer.insertSublayer(gradientLayer, at: 0)

        // 各パーツに対する諸々
        if let button = self as? UIButton {
            if let imageView = button.imageView {
                button.bringSubviewToFront(imageView)
            }
        }
        return self
    }

    /// 黒から透明のグラデーション
    @discardableResult
    func gradientGrayBackground(direction: GradientDirection) -> UIView {
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds

        gradientLayer.colors = [UIColor.gray.withAlphaComponent(0.4).cgColor,
                                UIColor.gray.withAlphaComponent(0).cgColor]

        switch direction {
        case .horizontal:
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0)
        case .vertical:
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0, y: 1.0)
        }

        layer.insertSublayer(gradientLayer, at: 0)

        // 各パーツに対する諸々
        if let button = self as? UIButton {
            if let imageView = button.imageView {
                button.bringSubviewToFront(imageView)
            }
        }
        return self
    }

    /// 2階層グラデーション（赤、黄、青＋白グラデーション）
    @discardableResult
    func gradientRYBAndWhite() -> UIView {
        let gradientLayer1: CAGradientLayer = CAGradientLayer()
        gradientLayer1.frame = bounds
        gradientLayer1.colors = [UIColor.init(rgbHexString: "#FFCCDE")!.cgColor,
                                 UIColor.init(rgbHexString: "#FFF3DC")!.cgColor,
                                 UIColor.init(rgbHexString: "#99E7FF")!.cgColor]
        applyDirection(gradientLayer: gradientLayer1, direction: .horizontal)
        gradientLayer1.locations = [0, 0.5, 1]
        layer.insertSublayer(gradientLayer1, at: 0)

        let gradientLayer2: CAGradientLayer = CAGradientLayer()
        gradientLayer2.frame = bounds
        gradientLayer2.colors = [UIColor.white.withAlphaComponent(0).cgColor,
                                 UIColor.white.withAlphaComponent(0).cgColor,
                                 UIColor.white.cgColor]
        applyDirection(gradientLayer: gradientLayer2, direction: .vertical)
        gradientLayer2.locations = [0, 0.08, 1]
        layer.insertSublayer(gradientLayer2, above: gradientLayer1)

        // 各パーツに対する諸々
        if let button = self as? UIButton {
            if let imageView = button.imageView {
                button.bringSubviewToFront(imageView)
            }
        }
        return self
    }

    // 方向を変更（2パターンのみ）
    @discardableResult
    func applyDirection(gradientLayer: CAGradientLayer, direction: GradientDirection) -> CAGradientLayer {
        switch direction {
        case .horizontal:
            // 左から右へ
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        case .vertical:
            // 上から下へ
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        }
        return gradientLayer
    }

}

enum GradientDirection {
    case horizontal
    case vertical
}
