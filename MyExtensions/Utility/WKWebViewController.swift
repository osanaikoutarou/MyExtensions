//
//  WKWebViewController.swift
//  Kenchikukatachi
//
//  Created by osanai on 2018/07/23.
//  Copyright © 2018年 長内幸太郎. All rights reserved.
//

import UIKit
import WebKit

class WKWebViewController:NSObject, WKNavigationDelegate {
    
    typealias WKNavigationClosure = ((_ navigation:WKNavigation) -> Void)
    
    var didStartProvisionalNavigation:WKNavigationClosure?
    var didCommitNavigation:WKNavigationClosure?
    var didFinishNavigation:WKNavigationClosure?
    var didFailProvisionalNavigation:WKNavigationClosure?
    var didReceiveServerRedirectForProvisionalNavigation:WKNavigationClosure?
    
    var changedEstimatedProgress:((_ estimatedProgress:Double) -> ())?
    var changedTitle:((_ title:String) -> ())?
    var changedLoading:((_ loading:Bool) -> ())?
    var changedCanGoBack:((_ canGoBack:Bool) -> ())?
    var changedCanGoForward:((_ canGoForward:Bool) -> ())?
    
    let wkWebView:WKWebView
    
    
    init(wkWebView:WKWebView, url:URL) {
        self.wkWebView = wkWebView
        super.init()
        self.wkWebView.load(NSURLRequest(url: url) as URLRequest)
        setupWKWebViewDefault()
        setupObserver()
    }
    deinit {
        removeObservers()
    }
    
    func setup(didStartProvisionalNavigation:WKNavigationClosure?,
               didCommitNavigation:WKNavigationClosure?,
               didFinishNavigation:WKNavigationClosure?,
               didFailProvisionalNavigation:WKNavigationClosure?,
               didReceiveServerRedirectForProvisionalNavigation:WKNavigationClosure?,
               changedEstimatedProgress:((_ estimatedProgress:Double) -> ())?,
               changedTitle:((_ title:String) -> ())?,
               changedLoading:((_ loading:Bool) -> ())?,
               changedCanGoBack:((_ canGoBack:Bool) -> ())?,
               changedCanGoForward:((_ canGoForward:Bool) -> ())?) {
        
        self.didStartProvisionalNavigation = didStartProvisionalNavigation
        self.didCommitNavigation = didCommitNavigation
        self.didFinishNavigation = didFinishNavigation
        self.didFailProvisionalNavigation = didFailProvisionalNavigation
        self.didReceiveServerRedirectForProvisionalNavigation = didReceiveServerRedirectForProvisionalNavigation
        self.changedEstimatedProgress = changedEstimatedProgress
        self.changedTitle = changedTitle
        self.changedLoading = changedLoading
        self.changedCanGoBack = changedCanGoBack
    }
    
    
    func setupWKWebViewDefault() {
        wkWebView.navigationDelegate = self
        wkWebView.allowsBackForwardNavigationGestures = true
    }
    
    func setupObserver() {
        wkWebView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        wkWebView.addObserver(self, forKeyPath: "title", options: .new, context: nil)
        wkWebView.addObserver(self, forKeyPath: "loading", options: .new, context: nil)
        wkWebView.addObserver(self, forKeyPath: "canGoBack", options: .new, context: nil)
        wkWebView.addObserver(self, forKeyPath: "canGoForward", options: .new, context: nil)
    }
    func removeObservers() {
        wkWebView.removeObserver(self, forKeyPath: "estimatedProgress")
        wkWebView.removeObserver(self, forKeyPath: "title")
        wkWebView.removeObserver(self, forKeyPath: "loading")
        wkWebView.removeObserver(self, forKeyPath: "canGoBack")
        wkWebView.removeObserver(self, forKeyPath: "canGoForward")
    }
    
    //MARK: NSKeyValueObserving methods
    
    override func observeValue(forKeyPath keyPath: String?,
                               of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?,
                               context: UnsafeMutableRawPointer?) {
        
        guard let keyPath = keyPath, let change = change else {
            return
        }
        
        if keyPath == "estimatedProgress" {
            // ex:プログレスバーを更新する
            // self.wkWebView.estimatedProgress * 100.0f
            // [self.navigationController setSGProgressPercentage:self.webView.estimatedProgress * 100.0f];
            
            if let changedEstimatedProgress = changedEstimatedProgress {
                changedEstimatedProgress(wkWebView.estimatedProgress)
            }
        }
        if keyPath == "title" {
            // titleが変更された
            
            if let changedTitle = changedTitle {
                changedTitle(wkWebView.title!)
            }
        }
        if keyPath == "loading" {
            // loading中かどうか
            // self.wkWebView.loading
            // [UIApplication sharedApplication].networkActivityIndicatorVisible = self.wkWebView.loading;
            
            // ex:リロードボタンと読み込み停止ボタンの有効・無効を切り替える
            // self.reloadButton.enabled = !self.wkWebView.loading;
            // self.stopButton.enabled = self.wkWebView.loading;
            
            if let changedLoading = changedLoading {
                changedLoading(wkWebView.isLoading)
            }
        }
        if keyPath == "canGoBack" {
            // ex:「＜」ボタンの有効・無効を切り替える
            // self.backButton.enabled = self.wkWebView.canGoBack;
            
            if let changedCanGoBack = changedCanGoBack {
                changedCanGoBack(wkWebView.canGoBack)
            }
        }
        if keyPath == "canGoForward" {
            // ex:「＞」ボタンの有効・無効を切り替える
            // self.forwardButton.enabled = self.wkWebView.canGoForward;
            
            if let changedCanGoForward = changedCanGoForward {
                changedCanGoForward(wkWebView.canGoForward)
            }
        }
        
    }
    
    //MARK: Nav methods
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
//        print("webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!)")
        // ページの読み込み準備開始
        if let didStartProvisionalNavigation = didStartProvisionalNavigation {
            didStartProvisionalNavigation(navigation)
        }
    }
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
//        print("webView(_ webView: WKWebView, didCommit navigation: WKNavigation!)")
        // ページが見つかり、読み込み開始
        if let didCommitNavigation = didCommitNavigation {
            didCommitNavigation(navigation)
        }
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        print("webView(_ webView: WKWebView, didFinish navigation: WKNavigation!)")
        // ページ読み込み完了
        if let didFinishNavigation = didFinishNavigation {
            didFinishNavigation(navigation)
        }
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
//        print("webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error)")
    }
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
//        print("webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error)")
        // ページ読み込み失敗
        if let didFailProvisionalNavigation = didFailProvisionalNavigation {
            didFailProvisionalNavigation(navigation)
        }
    }
    // 認証用
//    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
//        print("webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void)")
//    }
    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
//        print("webViewWebContentProcessDidTerminate")
    }
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        // 表示中にリダイレクト
        if let didReceiveServerRedirectForProvisionalNavigation = didReceiveServerRedirectForProvisionalNavigation {
            didReceiveServerRedirectForProvisionalNavigation(navigation)
        }
    }
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
//        print("webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy)")
        decisionHandler(.allow)
    }
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
//        print("webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void)")
        
        let url = webView.url
        let req = navigationAction.request
        
        print(url ?? "url is empty")
        print(req)
        
        //        //キャンセル
        //        //decisionHandler(WKNavigationActionPolicyCancel);
        //        //読み込み続行
        //        decisionHandler(WKNavigationActionPolicyAllow);
        
        if (navigationAction.navigationType == .linkActivated){
            decisionHandler(.cancel)
        } else {
            decisionHandler(.allow)
        }
    }
    
}

extension WKWebViewController {
    
    func goSafari() {
        if( UIApplication.shared.canOpenURL(self.wkWebView.url!) ) {
            UIApplication.shared.open(self.wkWebView.url!)
        }
        
    }
}
