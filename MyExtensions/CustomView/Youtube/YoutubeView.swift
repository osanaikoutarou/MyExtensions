//
//  YoutubeView.swift
//  ReeachA
//
//  Created by osanai on 2019/03/06.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit
import WebKit
import Kingfisher

class YoutubeView: UIView {
    
    var contentView: UIView!
    @IBOutlet weak var wkwebview: WKWebView!
    @IBOutlet weak var loadingImageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var wkwebviewController: WKWebViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("awakefromnib")
        commonInit()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    private func commonInit() {
        let className = String(describing: type(of: self))
        contentView = Bundle.main.loadNibNamed(className, owner: self, options: nil)?.first as? UIView
        addSubview(contentView)
        contentView.frame = self.frame
        contentView.bindFrameToSuperviewBounds()
        
        wkwebview.scrollView.isScrollEnabled = false
    }
    
    func load(id: String) {
        activityIndicator.startAnimating()

        loadingImageView.isHidden = false
        loadingImageView.alpha = 1.0

        loadingImageView.kf.setImage(with: YoutubeUtility.thumbnail(id: id, type: YoutubeUtility.ThumbnailType.mq))
        
        let url = URL(string: "https://www.youtube.com/embed/" + id)!
        wkwebviewController = WKWebViewController(wkWebView: wkwebview, url: url)
        wkwebviewController.setup(didStartProvisionalNavigation: { (wknav) in
            
        }, didCommitNavigation: { (wknav) in
            
        }, didFinishNavigation: { (wknav) in
            self.activityIndicator.stopAnimating()
            UIView.animate(withDuration: 0.5, delay: 0.5, options: [], animations: {
                self.loadingImageView.alpha = 0
            }, completion: { (finished) in
                self.loadingImageView.isHidden = true
            })
        }, didFailProvisionalNavigation: { (wknav) in
            
        }, didReceiveServerRedirectForProvisionalNavigation: { (wknav) in
            
        }, changedEstimatedProgress: { (progress) in
            
        }, changedTitle: { (title) in
            
        }, changedLoading: { (loading) in
            
        }, changedCanGoBack: { (canGoBack) in
            
        }, changedCanGoForward: { (canGoForward) in
            
        })
    }
}
