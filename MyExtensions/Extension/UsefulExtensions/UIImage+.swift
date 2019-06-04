//
//  UIImage+.swift
//  SwiftExtensions
//
//  Created by Tatsuya Tanaka on 20171218.
//  Copyright © 2017年 tattn. All rights reserved.
//

import UIKit

//public extension UIImage {
//    public convenience init(color: UIColor, size: CGSize) {
//        UIGraphicsBeginImageContext(size)
//        guard let context: CGContext = UIGraphicsGetCurrentContext() else {
//            self.init()
//            return
//        }
//
//        context.setFillColor(color.cgColor)
//        context.fill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
//
//        guard let image: UIImage = UIGraphicsGetImageFromCurrentImageContext() else {
//            self.init()
//            return
//        }
//        UIGraphicsEndImageContext()
//
//        if let cgImage = image.cgImage {
//            self.init(cgImage: cgImage)
//        } else {
//            self.init()
//        }
//    }
//
//    public func image(withTint color: UIColor) -> UIImage {
//        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
//        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
//
//        guard let context: CGContext = UIGraphicsGetCurrentContext(), let cgImage = cgImage else {
//            return UIImage()
//        }
//
//        context.scaleBy(x: 1, y: -1)
//        context.translateBy(x: 0, y: -self.size.height)
//        context.clip(to: rect, mask: cgImage)
//        context.setFillColor(color.cgColor)
//        context.fill(rect)
//        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
//            return UIImage()
//        }
//        UIGraphicsEndImageContext()
//
//        return image
//    }
//
//    public func cropping(to rect: CGRect) -> UIImage? {
//        let originalRect = CGRect(
//            x: rect.origin.x * scale,
//            y: rect.origin.y * scale,
//            width: rect.size.width * scale,
//            height: rect.size.height * scale
//        )
//
//        guard let cgImage = cgImage,
//            let imageRef = cgImage.cropping(to: originalRect) else { return nil }
//
//        return UIImage(cgImage: imageRef, scale: scale, orientation: imageOrientation)
//    }
//
//    public func resize(to size: CGSize) -> UIImage? {
//        UIGraphicsBeginImageContext(CGSize(
//            width: size.width * scale,
//            height: size.height * scale
//        ))
//
//        draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
//
//        let image = UIGraphicsGetImageFromCurrentImageContext()
//        guard let cgImage = image?.cgImage else { return nil }
//
//        defer { UIGraphicsEndImageContext() }
//        return UIImage(cgImage: cgImage, scale:  scale, orientation: imageOrientation)
//    }
//
//    public func resizeAspectFit(to size: CGSize) -> UIImage? {
//        let widthRatio = size.width / self.size.width
//        let heightRatio = size.height / self.size.height
//        let ratio = widthRatio < heightRatio ? widthRatio : heightRatio
//
//        let resizedSize = CGSize(width: self.size.width*ratio, height: self.size.height*ratio)
//
//        UIGraphicsBeginImageContextWithOptions(resizedSize, false, 0.0)
//        draw(in: CGRect(x: 0, y: 0, width: resizedSize.width, height: resizedSize.height))
//        defer { UIGraphicsEndImageContext() }
//        return UIGraphicsGetImageFromCurrentImageContext()
//    }
//
//    public func toJPEG(quarity: CGFloat = 1.0) -> Data? {
//        return UIImageJPEGRepresentation(self, quarity)
//    }
//
//    public func toPNG(quarity: CGFloat = 1.0) -> Data? {
//        return UIImagePNGRepresentation(self)
//    }
//
//    public func rounded() -> UIImage? {
//        let imageView = UIImageView(image: self)
//        imageView.layer.cornerRadius = min(size.height/2, size.width/2)
//        imageView.layer.masksToBounds = true
//        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, 0.0)
//        guard let context = UIGraphicsGetCurrentContext() else { return nil }
//        imageView.layer.render(in: context)
//        defer { UIGraphicsEndImageContext() }
//        return UIGraphicsGetImageFromCurrentImageContext()
//    }
//}
