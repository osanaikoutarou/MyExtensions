//
//  CommonDialogViewController.swift
//  MyExtensions
//
//  Created by 長内幸太郎 on 2019/10/06.
//  Copyright © 2019 osanai. All rights reserved.
//

import UIKit

class CommonDialogViewController: UIViewController {

    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var stackView: UIStackView!

    var innerView: UIView!

    var dismissCompletion: (() -> Void)?

    var allowDismissWhenTouchOutside: Bool = true

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        modalPresentationStyle = .custom
        transitioningDelegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view.addGestureRecognizer(tap)
    }

    private func setupInnerView() {
        innerView.layer.cornerRadius = 5
        innerView.clipsToBounds = true

        // 一度全部除外
        stackView.arrangedSubviews.forEach {
            stackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
        stackView.addArrangedSubview(innerView)
    }

    func setup(innerView: UIView, allowDismissWhenTouchOutside: Bool = true, dismissCompletion: (() -> Void)? = nil)  {
        self.innerView = innerView
        if isViewLoaded {
            setupInnerView()
        }
    }

    @objc
    func viewTapped() {
        dismiss(animated: true, completion: dismissCompletion)
    }

}

// MARK: - UIViewControllerTransitioningDelegate

extension CommonDialogViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return CommonDialogPresentationController(presentedViewController: presented, presenting: presenting)
    }

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CommonDialogAnimationController(forPresented: true)
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CommonDialogAnimationController(forPresented: false)
    }
}

// MARK: - CommonDialogAnimationController

class CommonDialogAnimationController: NSObject, UIViewControllerAnimatedTransitioning {

    let forPresented: Bool

    init(forPresented: Bool) {
        self.forPresented = forPresented
    }

    // アニメーション時間
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.2
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if (forPresented) {
            presentAnimateTransition(transitionContext: transitionContext)
        }
        else {
            dismissAnimateTransition(transitionContext: transitionContext)
        }
    }

    // 表示時に使用するアニメーション
    func presentAnimateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let viewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
        let containerView = transitionContext.containerView
        containerView.addSubview(viewController.view)
        viewController.view.alpha = 0.0

        UIView.animate(withDuration: transitionDuration(using: transitionContext),
                       delay: 0,
                       options: [.curveEaseOut],
                       animations: {
                        viewController.view.alpha = 1.0
                        viewController.view.transform = CGAffineTransform.identity
        },
                       completion: { finished in
                        transitionContext.completeTransition(true)
        })
    }

    // 非表示時に使用するアニメーション
    func dismissAnimateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let viewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!

        UIView.animate(withDuration: transitionDuration(using: transitionContext),
                       animations: {
                        viewController.view.alpha = 0.0
        },
                       completion: { finished in
                        transitionContext.completeTransition(true)
        })
    }

}

// MARK: - CommonDialogPresentationController
class CommonDialogPresentationController: UIPresentationController {

    /// 呼び出し元のViewControllerの上に重ねるオーバーレイ
    private let overlayView = UIView()

    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()

        // 表示トランジション開始前の処理
        overlayView.frame = containerView!.bounds
        overlayView.backgroundColor = .black
        overlayView.alpha = 0.0
        containerView!.insertSubview(overlayView, at: 0)

        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { [unowned self] _ in
            self.overlayView.alpha = 0.4
        })
    }

    override func dismissalTransitionWillBegin() {
        super.dismissalTransitionWillBegin()

        // 非表示トランジション開始前の処理
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { [unowned self] _ in
            self.overlayView.alpha = 0.0
        })
    }

    override func dismissalTransitionDidEnd(_ completed: Bool) {
        super.dismissalTransitionDidEnd(completed)

        // 非表示トランジション終了時の処理
        if completed {
            overlayView.removeFromSuperview()
        }
    }

    override var frameOfPresentedViewInContainerView : CGRect {
        return containerView!.bounds
    }

    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()

        /// レイアウト開始前の処理
        overlayView.frame = containerView!.bounds
        presentedView!.frame = frameOfPresentedViewInContainerView
    }

}

// MARK: - Creator
extension CommonDialogViewController {
    static func create(innerView: UIView, allowDismissWhenTouchOutside: Bool = true, dismissCompletion: (() -> Void)? = nil) -> CommonDialogViewController {
        let dialogViewController = UIStoryboard(name: "CommonDialog", bundle: nil).instantiateInitialViewController() as! CommonDialogViewController
        dialogViewController.setup(innerView: innerView, allowDismissWhenTouchOutside: allowDismissWhenTouchOutside, dismissCompletion: dismissCompletion)
        return dialogViewController
    }
}

// MARK: - InnerView 汎用性の高いもの
//
//typealias AlertViewAction = ((_ sender: UIView) -> Void)
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
