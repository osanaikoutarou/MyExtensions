//
//  WKWebViewManager.swift
//  creema-ios
//
//  Created by osanai on 2019/09/04.
//  Copyright © 2019 creema. All rights reserved.
//

import UIKit
import WebKit

/// WKWebViewの取り扱いをClosure化
/// WKNavigationDelegate, NSKeyValueObservingの受け先
@objcMembers final class WKWebViewManager: NSObject {

    let wkWebView: WKWebView

    /// NSKeyValueObservingのPath
    enum ObserverPath: String {
        case estimatedProgress
        case title
        case loading
        case canGoBack
        case canGoForward

        static var allCases: [ObserverPath] = [.estimatedProgress, .title, .loading, .canGoBack, .canGoForward]

        static func detect(keyPath: String) -> ObserverPath? {
            for observerPath in ObserverPath.allCases where keyPath == observerPath.rawValue {
                return observerPath
            }
            return nil
        }
    }

    // WKNavigationDelegate用
    typealias DecidePolicyForNavigationActionClosure = ((_ wkWebView: WKWebView, _ navigationAction: WKNavigationAction) -> WKNavigationActionPolicy)
    typealias DecidePolicyForNavigationResponseClosure = ((_ wkWebView: WKWebView, _ navigationResponse: WKNavigationResponse) -> WKNavigationResponsePolicy)
    typealias WKNavigationClosure = ((_ wkWebView: WKWebView, _ navigation: WKNavigation) -> Void)
    typealias WKNavigationFailClosure = ((_ wkWebView: WKWebView, _ navigation: WKNavigation, _ error: Error) -> Void)
    typealias DidReceiveChallengeClosure = ((_ wkWebView: WKWebView, _ challenge: URLAuthenticationChallenge, _ completionHandler: ((URLSession.AuthChallengeDisposition, URLCredential?) -> Void)?) -> Void)

    var decidePolicyForNavigationAction: DecidePolicyForNavigationActionClosure?
    var decidePolicyForNavigationResponse: DecidePolicyForNavigationResponseClosure?
    var didStartProvisionalNavigation: WKNavigationClosure?
    var didCommitNavigation: WKNavigationClosure?
    var didFinishNavigation: WKNavigationClosure?
    var didFailProvisionalNavigation: WKNavigationFailClosure?
    var didReceiveServerRedirectForProvisionalNavigation: WKNavigationClosure?
    var didFailNavigation: WKNavigationFailClosure?
    var didReceiveChallenge: DidReceiveChallengeClosure?

    // NSKeyValueObserving用
    typealias DidChangeEstimatedProgressClosure = ((_ estimatedProgress: Double) -> Void)
    typealias DidChangeTitleClosure = ((_ title: String?) -> Void)
    typealias DidChangeLoadingClosure = ((_ isLoading: Bool) -> Void)
    typealias DidChangeCanGoBackClosure = ((_ canGoBack: Bool) -> Void)
    typealias DidChangeCanGoForwardClosure = ((_ canGoForward: Bool) -> Void)
    var didChangeEstimatedProgress: DidChangeEstimatedProgressClosure?
    var didChangeTitle: DidChangeTitleClosure?
    var didChangeLoading: DidChangeLoadingClosure?
    var didChangeCanGoBack: DidChangeCanGoBackClosure?
    var didChangeCanGoForward: DidChangeCanGoForwardClosure?

    init(wkWebView: WKWebView) {
        self.wkWebView = wkWebView
        super.init()
        self.wkWebView.navigationDelegate = self
        self.wkWebView.uiDelegate = self
        addObservers()
    }

    deinit {
        removeObservers()
    }

    private func addObservers() {
        ObserverPath.allCases.forEach { (path) in
            self.wkWebView.addObserver(self, forKeyPath: path.rawValue, options: .new, context: nil)
        }
    }

    private func removeObservers() {
        ObserverPath.allCases.forEach { (path) in
            self.wkWebView.removeObserver(self, forKeyPath: path.rawValue)
        }
    }
}

extension WKWebViewManager {
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {

        guard let keyPath = keyPath, let observerPath = ObserverPath.detect(keyPath: keyPath) else {
            return
        }

        switch observerPath {
        case .estimatedProgress:
            didChangeEstimatedProgress?(wkWebView.estimatedProgress)
        case .title:
            didChangeTitle?(wkWebView.title)
        case .loading:
            didChangeLoading?(wkWebView.isLoading)
        case .canGoBack:
            didChangeCanGoBack?(wkWebView.canGoBack)
        case .canGoForward:
            didChangeCanGoForward?(wkWebView.canGoForward)
        }
    }
}

extension WKWebViewManager: WKNavigationDelegate {

    /// 画面遷移前に移動判断をする（default allow）
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping     (WKNavigationActionPolicy) -> Void) {

        let policy: WKNavigationActionPolicy = decidePolicyForNavigationAction?(wkWebView, navigationAction) ?? .allow
        decisionHandler(policy)
    }

    /// 画面遷移先のレスポンスに応じて移動判断をする（default allow）
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {

        let policy: WKNavigationResponsePolicy = decidePolicyForNavigationResponse?(wkWebView, navigationResponse) ?? .allow
        decisionHandler(policy)
    }

    /// ページの読み込み準備開始
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        didStartProvisionalNavigation?(wkWebView, navigation)
    }

    /// ページが見つかり、読み込み開始
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        didCommitNavigation?(wkWebView, navigation)
    }

    /// ページの読み込み完了
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        didFinishNavigation?(wkWebView, navigation)
    }

    /// ページの読み込み失敗
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        didFailProvisionalNavigation?(wkWebView, navigation, error)
    }

    /// 表示中にリダイレクトがあった
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        didReceiveServerRedirectForProvisionalNavigation?(wkWebView, navigation)
    }

    /// 遷移中二エラーが発生
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        didFailNavigation?(wkWebView, navigation, error)
    }

    /// 認証チャレンジに応答する必要があるときに呼び出される
    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        if let didReceiveChallenge = didReceiveChallenge {
            didReceiveChallenge(wkWebView, challenge, completionHandler)
        }
        else {
            completionHandler(URLSession.AuthChallengeDisposition.performDefaultHandling, nil)
        }
    }
}

extension WKWebViewManager: WKUIDelegate {
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        // 新しいウィンドウで開くものをそのまま遷移させる
        guard let url = navigationAction.request.url else {
            return nil
        }

        guard let targetFrame = navigationAction.targetFrame, targetFrame.isMainFrame else {
            webView.load(URLRequest(url: url))
            return nil
        }
        return nil
    }
}

extension WKWebViewManager {
    func setup(decidePolicyForNavigationAction: DecidePolicyForNavigationActionClosure? = nil,
               decidePolicyForNavigationResponse: DecidePolicyForNavigationResponseClosure? = nil,
               didStartProvisionalNavigation: WKNavigationClosure? = nil,
               didCommitNavigation: WKNavigationClosure? = nil,
               didFinishNavigation: WKNavigationClosure? = nil,
               didFailProvisionalNavigation: WKNavigationFailClosure? = nil,
               didReceiveServerRedirectForProvisionalNavigation: WKNavigationClosure? = nil,
               didChangeEstimatedProgress: DidChangeEstimatedProgressClosure? = nil,
               didChangeTitle: DidChangeTitleClosure? = nil,
               didChangeLoading: DidChangeLoadingClosure? = nil,
               didChangeCanGoBack: DidChangeCanGoBackClosure? = nil,
               didChangeCanGoForward: DidChangeCanGoForwardClosure? = nil,
               didFailNavigation: WKNavigationFailClosure? = nil,
               didReceiveChallenge: DidReceiveChallengeClosure? = nil) {
        self.decidePolicyForNavigationAction = decidePolicyForNavigationAction
        self.decidePolicyForNavigationResponse = decidePolicyForNavigationResponse
        self.didStartProvisionalNavigation = didStartProvisionalNavigation
        self.didCommitNavigation = didCommitNavigation
        self.didFinishNavigation = didFinishNavigation
        self.didFailProvisionalNavigation = didFailProvisionalNavigation
        self.didReceiveServerRedirectForProvisionalNavigation = didReceiveServerRedirectForProvisionalNavigation
        self.didChangeEstimatedProgress = didChangeEstimatedProgress
        self.didChangeTitle = didChangeTitle
        self.didChangeLoading = didChangeLoading
        self.didChangeCanGoBack = didChangeCanGoBack
        self.didChangeCanGoForward = didChangeCanGoForward
        self.didFailNavigation = didFailNavigation
        self.didReceiveChallenge = didReceiveChallenge
    }
}

/// Cookieを取得する方法
extension WKWebView {

    @available(iOS 11.0, *)
    private var httpCookieStore: WKHTTPCookieStore  {
        return WKWebsiteDataStore.default().httpCookieStore
    }

    @objc func getCookies(for domain: String? = nil, completion: @escaping ([String : Any])->())  {
        if #available(iOS 11.0, *) {
            var cookieDict = [String : AnyObject]()
            httpCookieStore.getAllCookies { cookies in
                for cookie in cookies {
                    if let domain = domain {
                        if cookie.domain.contains(domain) {
                            cookieDict[cookie.name] = cookie.properties as AnyObject?
                        }
                    }
                    else {
                        cookieDict[cookie.name] = cookie.properties as AnyObject?
                    }
                }
                completion(cookieDict)
            }
        }
    }
}

