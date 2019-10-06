////
////  CustomAlertViewController.swift
////  MyExtensions
////
////  Created by 長内幸太郎 on 2019/09/01.
////  Copyright © 2019 osanai. All rights reserved.
////
//
//import UIKit
//
//typealias AlertViewAction = ((_ sender: UIView) -> Void)
//
///// Dialog
///// 使い方
//final class CustomAlertViewController: UIViewController {
//
//    var allowDismissWhenTouchOutside: Bool = false
//
//    // 実際に表示するView
//    var subView: UIView!
////        = {
////        let v = UIView(frame: .zero)
////        v.backgroundColor = .clear
////        v.layer.cornerRadius = 16.0
////        v.clipsToBounds = true
////        v.isUserInteractionEnabled = true
////        return v
////    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        modalPresentationStyle = .custom
//        transitioningDelegate = self
//        view.backgroundColor = .clear
//
//        setupViews()
//
//        view.addSubview(rootView)
//        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewTap)))
//    }
//
//}
//
//// MARK: - UIViewControllerTransitioningDelegate
//
//extension CustomAlertViewController: UIViewControllerTransitioningDelegate {
//    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
//        return AlertPresentationController(presentedViewController: presented, presenting: presenting)
//    }
//
//    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return AlertAnimationController(forPresented: true)
//    }
//
//    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return AlertAnimationController(forPresented: false)
//    }
//}
//
//extension CustomAlertViewController {
//    private lazy var rootView: UIView = {
//        let v = UIView(frame: .zero)
//        v.backgroundColor = .clear
//        v.layer.cornerRadius = 16.0
//        v.clipsToBounds = true
//        v.isUserInteractionEnabled = true
//        return v
//    }()
//
//    // MARK: Action
//
//    var dismissCompletion: (() -> Void)?
//
//    @objc func viewTap() {
//        if allowDismissWhenTouchOutside {
//            dismiss(animated: true, completion: dismissCompletion)
//        }
//    }
//
//    // MARK: -
//
//    func setup(innerView: UIView) {
//        innerView.translatesAutoresizingMaskIntoConstraints = true
//        rootView.addSubview(innerView)
//        rootView.frame.size = innerView.bounds.size
//        rootView.center = CGPoint(x: view.frame.width/2, y: view.frame.height/2)
//        self.innerView = innerView
//    }
//}
//
//// MARK: - AlertAnimationController
//class AlertAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
//
//    let forPresented: Bool
//
//    init(forPresented: Bool) {
//        self.forPresented = forPresented
//    }
//
//    // アニメーション時間
//    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
//        return 0.2
//    }
//
//    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
//        if (forPresented) {
//            presentAnimateTransition(transitionContext: transitionContext)
//        }
//        else {
//            dismissAnimateTransition(transitionContext: transitionContext)
//        }
//    }
//
//    // 表示時に使用するアニメーション
//    func presentAnimateTransition(transitionContext: UIViewControllerContextTransitioning) {
//        let viewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
//        let containerView = transitionContext.containerView
//        containerView.addSubview(viewController.view)
//        viewController.view.alpha = 0.0
//        viewController.view.transform = CGAffineTransform(scaleX: 1.16, y: 1.16)
//
//        UIView.animate(withDuration: transitionDuration(using: transitionContext),
//                       delay: 0,
//                       options: [.curveEaseOut],
//                       animations: {
//                        viewController.view.alpha = 1.0
//                        viewController.view.transform = CGAffineTransform.identity
//        },
//                       completion: { finished in
//                        transitionContext.completeTransition(true)
//        })
//    }
//
//    // 非表示時に使用するアニメーション
//    func dismissAnimateTransition(transitionContext: UIViewControllerContextTransitioning) {
//        let viewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
//
//        UIView.animate(withDuration: transitionDuration(using: transitionContext),
//                       animations: {
//                        viewController.view.alpha = 0.0
//        },
//                       completion: { finished in
//                        transitionContext.completeTransition(true)
//        })
//    }
//
//}
//
//// MARK: - AlertPresentationController
//class AlertPresentationController: UIPresentationController {
//
//    /// 呼び出し元のViewControllerの上に重ねるオーバーレイ
//    private let overlayView = UIView()
//
//    override func presentationTransitionWillBegin() {
//        super.presentationTransitionWillBegin()
//
//        // 表示トランジション開始前の処理
//        overlayView.frame = containerView!.bounds
//        overlayView.backgroundColor = .black
//        overlayView.alpha = 0.0
//        containerView!.insertSubview(overlayView, at: 0)
//
//        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { [unowned self] _ in
//            self.overlayView.alpha = 0.4
//        })
//    }
//
//    override func dismissalTransitionWillBegin() {
//        super.dismissalTransitionWillBegin()
//
//        // 非表示トランジション開始前の処理
//        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { [unowned self] _ in
//            self.overlayView.alpha = 0.0
//        })
//    }
//
//    override func dismissalTransitionDidEnd(_ completed: Bool) {
//        super.dismissalTransitionDidEnd(completed)
//
//        // 非表示トランジション終了時の処理
//        if completed {
//            overlayView.removeFromSuperview()
//        }
//    }
//
//    override var frameOfPresentedViewInContainerView : CGRect {
//        return containerView!.bounds
//    }
//
//    override func containerViewWillLayoutSubviews() {
//        super.containerViewWillLayoutSubviews()
//
//        /// レイアウト開始前の処理
//        overlayView.frame = containerView!.bounds
//        presentedView!.frame = frameOfPresentedViewInContainerView
//    }
//
//}
//
//// MARK: - Creator
//extension CustomAlertViewController {
//    static func create(innerView: UIView) -> CustomAlertViewController {
//        innerView.frame.size = innerView.sizeThatFits(.zero)
//        let alert = CustomAlertViewController()
//        alert.setup(innerView: innerView)
//        return alert
//    }
//}
//
//// MARK: - InnerView 汎用性の高いもの
//
///// OKとNGのAlert
///// 注意:Cancelのアクションは利用側で書いてください
//class OKNGCustomAlertView: UIView {
//
//    static func create(title: String,
//                       positiveTitle: String,
//                       cancelTitle: String,
//                       positiveAction: AlertViewAction?,
//                       cancelAction: AlertViewAction?) -> OKNGCustomAlertView {
//
//        let alertView = OKNGCustomAlertView(frame: .zero)
////        alertView.titleLabel.text = title
////        alertView.positiveButton.setTitle(positiveTitle, for: .normal)
////        alertView.cancelButton.setTitle(cancelTitle, for: .normal)
//        alertView.positiveAction = positiveAction
//        alertView.cancelAction = cancelAction
//        return alertView
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        backgroundColor = .white
//
////        addSubview(titleLabel)
////        addSubview(positiveButton)
////        addSubview(cancelButton)
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func sizeThatFits(_ size: CGSize) -> CGSize {
//        let dialogWidth = UIScreen.main.bounds.width - 32.0 * 2
//        return CGSize(width: dialogWidth, height: 154)
//    }
//
//    // MARK: Action
//
//    var positiveAction: AlertViewAction?
//    var cancelAction: AlertViewAction?
//
//    @objc func positiveButtonTapped() {
//        positiveAction?(self)
//    }
//
//    @objc func cancelButtonTapped() {
//        cancelAction?(self)
//    }
//
//}
//
