//
//  DetailsViewController.swift
//  LotteryInfo
//
//  Created by apiapia on 6/3/17.
//  Copyright © 2017 apiapia. All rights reserved.
//

import UIKit
import WebKit
import SVProgressHUD

/* ShareProtocol 用协议代替全局函数 */
class DetailsViewController: XMBaseViewController,WKUIDelegate,WKNavigationDelegate,UINavigationControllerDelegate {

    var webView:WKWebView!
    var id:Int16?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "资讯"
        
    //  print ("这个是DetailsViewController获得过来的ID值：",self.id ?? "为空")
        
        initWebView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.rightBarButtonItem = shareButton()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        SVProgressHUD.dismiss()
    }
    func initWebView(){
        
        let urlString = "http://www.baidu.com"
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        
         SVProgressHUD.show(withStatus: "加载中")
        
        self.webView = WKWebView(frame: self.view.frame)
        view.addSubview(webView)
        self.webView.load(request)
        
        webView.navigationDelegate = self
        webView.uiDelegate = self
 }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        SVProgressHUD.dismiss()
        print("加载完成")
    }

    func shareButton() -> UIBarButtonItem {
        let shareItem = UIButton.init(type: .custom)
        shareItem.setImage(UIImage(named: "fun_ic_share"), for: .normal)
        shareItem.sizeToFit()
        shareItem.frame.size = CGSize(width: 30, height: 30)
        shareItem.contentHorizontalAlignment = .right
//        shareItem.addTarget(self, action: #selector(self.shareToAnother), for: .touchUpInside)
        return UIBarButtonItem.init(customView: shareItem)
        
    }
         
}
