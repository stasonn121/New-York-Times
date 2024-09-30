//
//  SelectPostViewController.swift
//  New York Times
//
//  Created by user on 29.04.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit
import WebKit

class SelectPostViewController: UIViewController {
    let selectPostController = SelectPostController()
    @IBOutlet private weak var postView: WKWebView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postView.navigationDelegate = self
        selectPostController.delegate = self
        selectPostController.getRequest()
        activityIndicator.startAnimating()
    }
    
}

extension SelectPostViewController: SelectPostControllerDelegate {
    
    func selectPostController(_ controller: SelectPostController, request: URLRequest) {
        postView.load(request)
    }
    
}

extension SelectPostViewController: WKNavigationDelegate {

    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
    
}
