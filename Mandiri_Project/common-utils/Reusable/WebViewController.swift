//
//  WebViewController.swift
//  Mandiri_Project
//
//  Created by Adhella Subalie on 04/03/22.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    var urlString: String = ""
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let URL = URL(string: urlString) {
            let request = URLRequest(url: URL)
            webView.load(request)
        }
    }
}
