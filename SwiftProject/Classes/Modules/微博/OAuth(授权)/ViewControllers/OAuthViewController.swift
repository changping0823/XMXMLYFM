//
//  OAuthViewController.swift
//  SwiftProject
//
//  Created by Charles on 2021/4/29.
//

import UIKit

import UIKit
import WebKit
import ProgressHUD

class OAuthViewController: BaseViewController,WKNavigationDelegate {
    let redirect_uri = "http://www.baidu.com"
    let client_id = "3212157982"
    let client_secret = "3f24b3b21f75d8cf5d4201dc3683167f"
    
    
    private lazy var webview: WKWebView = WKWebView()
    
//    override func loadView(){
////        webview.dele
//    }
    override func viewDidLoad() {
        super.viewDidLoad()

        //https://api.weibo.com/oauth2/authorize?client_id=3212157982&response_type=code&redirect_uri=http://www.baidu.com
        //创建wkwebview
        webview.navigationDelegate = self
        //创建网址
        let urlStr = String(format: "https://api.weibo.com/oauth2/authorize?client_id=%@&response_type=code&redirect_uri=%@",client_id,redirect_uri)

        let url = NSURL(string: urlStr)
        //创建请求
        let request = NSURLRequest(url: url! as URL)
        //加载请求
        webview.load(request as URLRequest)
        //添加wkwebview
        self.view.addSubview(webview)
        
        webview.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("didStartProvisionalNavigation")
        ProgressHUD.show()
        
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("didFinish")
        ProgressHUD.dismiss()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("didFail" + error.localizedDescription)
        ProgressHUD.dismiss()
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        guard let url = navigationAction.request.url else {
            decisionHandler(.cancel)
            return
        }
        
        if !url.absoluteString.hasPrefix(redirect_uri) {
            decisionHandler(.allow)
            return
        }
        
        if let query = url.query, query.hasPrefix("code=") {
            let code = (query as NSString).substring(from: "code=".count)
            //  准备url
            let url = "https://api.weibo.com/oauth2/access_token"
            
            //  准备参数
            let params = [
                "client_id": client_id,
                "client_secret": client_secret,
                "grant_type": "authorization_code",
                "code": code,
                "redirect_uri": redirect_uri
            ]
            Network.POST(url: url, parameters: params).success { (respone) in
                print("登陆成功：%@",respone)
                UIApplication.shared.keyWindow?.rootViewController = BaseTabBarController()
            }.failed { (error) in
                print("登陆失败：%@",error)
            }
        }
        

        decisionHandler(.allow)
        
    }
    
    func accessTokenWithCode(_ code:String) {

    }

}
