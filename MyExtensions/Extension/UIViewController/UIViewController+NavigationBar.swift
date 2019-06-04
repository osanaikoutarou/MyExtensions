//
//  UIViewController+NavigationBar.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/01/27.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func addSafariButton() {
        let button = UIButton.init(type: .system)
        button.setImage(UIImage(named: "icon_safari")!, for: .normal)
        button.addAction(for: .touchUpInside) {
        }
        let barButtonItem = UIBarButtonItem.init(customView: button)
        self.navigationItem.rightBarButtonItem = barButtonItem
    }
    
    func addAnyButtonToRight(title:String?, image:UIImage?, action:@escaping (() -> Void)) {
        let button = UIButton.init(type: .system)
        button.setTitle(title, for: .normal)
        button.setImage(image, for: .normal)
        button.addAction(for: .touchUpInside, action)
        let barButtonItem = UIBarButtonItem.init(customView: button)
        self.navigationItem.rightBarButtonItem = barButtonItem
    }
    
    func addAnyButtonsToRight(image1:UIImage?, image2:UIImage?, action1:@escaping (() -> Void), action2:@escaping (() -> Void)) {
        let button1 = UIButton.init(type: .system)
        button1.setImage(image1, for: .normal)
        button1.addAction(for: .touchUpInside, action1)
        let barButtonItem1 = UIBarButtonItem.init(customView: button1)

        let button2 = UIButton.init(type: .system)
        button2.setImage(image2, for: .normal)
        button2.addAction(for: .touchUpInside, action2)
        let barButtonItem2 = UIBarButtonItem.init(customView: button2)

        self.navigationItem.rightBarButtonItems = [barButtonItem1, barButtonItem2]
    }
    
//    func addMenuButton() {
//
//        let button = UIButton.init(type: .custom)
//        let noimage = UIImage(named: "user_noimage22")!
//
//        let width = 30.f
//
//        button.widthAnchor.constraint(equalToConstant: width).isActive = true
//        button.heightAnchor.constraint(equalToConstant: width).isActive = true
//        button.clipsToBounds = true
//        button.layer.masksToBounds = true
//        button.layer.cornerRadius = width/2.0
//
//        button.imageView?.contentMode = .scaleAspectFill
//        button.sd_setImage(with: URL(string: MyAccount.shared.profile.iconUrl), for: .normal, placeholderImage: noimage, options: [], completed: nil)
//
//        button.addAction(for: .touchUpInside) {
//            if (self.slideMenuController()?.isLeftOpen())! {
//                self.slideMenuController()?.closeLeft()
//            }
//            else if (self.slideMenuController()?.isLeftHidden())! {
//                self.slideMenuController()?.openLeft()
//            }
//        }
//        let barButtonItem = UIBarButtonItem.init(customView: button)
//        self.navigationItem.leftBarButtonItem = barButtonItem
//    }
//
//    func addStatesCheckButton() {
//        let button = UIButton.init(type: .system)
//        button.setTitle("仕事一覧導線", for: .normal)
//        button.addAction(for: .touchUpInside) {
//            let vc = UIStoryboard(name: "OrderParent", bundle: nil).instantiateInitialViewController()
//            self .show(vc!, sender: nil)
//        }
//        let barButtonItem = UIBarButtonItem.init(customView: button)
//        self.navigationItem.rightBarButtonItem = barButtonItem
//    }
//
//    func addPlacedWorkStatesCheckButton() {
//        let button = UIButton.init(type: .system)
//        button.setTitle("依頼仕事一覧", for: .normal)
//        button.addAction(for: .touchUpInside) {
//            let vc = UIStoryboard(name: "OrderParent", bundle: nil).instantiateInitialViewController()
//            self .show(vc!, sender: nil)
//        }
//        let barButtonItem = UIBarButtonItem.init(customView: button)
//        self.navigationItem.rightBarButtonItem = barButtonItem
//    }
//
//
//    func addCloseButton() {
//        let button = UIButton.init(type: .system)
//        button.setImage(UIImage(named: "icon_close"), for: .normal)
//        button.addAction(for: .touchUpInside) {
//            self.dismiss(animated: true, completion: {
//            })
//        }
//        let barButtonItem = UIBarButtonItem.init(customView: button)
//        self.navigationItem.leftBarButtonItem = barButtonItem
//    }
//
//    func addProfileEditButton(action:@escaping (() -> Viod)) -> UIButton {
//        let button = UIButton.init(type: .system)
//        button.frame = CGRect(x: 0, y: 0, width: 60, height: 30)
//        button.setTitle("編集", for: .normal)
//        //        button.tintColor = .white //AppStrategy.navButtonTextColor
//        button.addAction(for: .touchUpInside, action)
//        button.border(borderColor: .white, borderWidth: 1)
//        button.corner(radius: button.frame.height/2.f)
//        let barButtonItem = UIBarButtonItem.init(customView: button)
//        self.navigationItem.rightBarButtonItem = barButtonItem
//
//        return button
//    }
//
//    func addCompleteButton(action:@escaping (() -> Viod)) {
//        let button = UIButton.init(type: .system)
//        button.setTitle("完了", for: .normal)
//        button.addAction(for: .touchUpInside, action)
//        let barButtonItem = UIBarButtonItem.init(customView: button)
//        self.navigationItem.rightBarButtonItem = barButtonItem
//    }
//
//    func addSelectWorkerButton(action:@escaping (() -> Viod)) {
//        let button = UIButton.init(type: .system)
//        button.setTitle("発注先を決定する", for: .normal)
//        button.addAction(for: .touchUpInside, action)
//        let barButtonItem = UIBarButtonItem.init(customView: button)
//        self.navigationItem.rightBarButtonItem = barButtonItem
//    }
//
//    func addSearchButton(action:@escaping (() -> Viod)) {
//        let button = UIButton.init(type: .system)
//        button.setImage(UIImage(named: "icon_search"), for: .normal)
//        button.addAction(for: .touchUpInside, action)
//        let barButtonItem = UIBarButtonItem.init(customView: button)
//        self.navigationItem.rightBarButtonItem = barButtonItem
//    }
//
//    func addEditWorkRequestButton(action:@escaping (() -> Viod)) {
//        addAnyButtonToRight(title: "編集", action: action)
//    }
//
//    func addMessageButton(action:@escaping (() -> Viod)) {
//        addAnyButtonToRight(title: "メッセージ", action: action)
//    }
//
//    func addAnyButtonToRight(title:String, action:@escaping (() -> Viod)) {
//        let button = UIButton.init(type: .system)
//        button.setTitle(title, for: .normal)
//        button.addAction(for: .touchUpInside, action)
//        let barButtonItem = UIBarButtonItem.init(customView: button)
//        self.navigationItem.rightBarButtonItem = barButtonItem
//    }
//
//    //MARK: transparent navigationbar
//
//    func setNavigationBarColor(navBarColor:UIColor, shadowColor:UIColor) {
//        let navImg = UIImage(color: navBarColor, size: CGSize.pxSize())
//        let shadowImg = UIImage(color: shadowColor, size: CGSize.pxSize())
//        self.navigationController?.navigationBar.setBackgroundImage(navImg, for: .default)
//        self.navigationController?.navigationBar.shadowImage = shadowImg
//        self.navigationController?.navigationBar.backgroundColor = .clear
//    }
    
}
