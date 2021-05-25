//
//  DYHomeViewController.swift
//  SwiftProject
//
//  Created by Charles on 2021/5/25.
//

import UIKit

class DYHomeViewController: DYBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置UI界面
        setupUI()

    }
    

    
}

// MARK:- 设置UI界面
extension DYHomeViewController {
    func setupUI() {
        // 0.不需要调整UIScrollView的内边距
        automaticallyAdjustsScrollViewInsets = false
        
        // 1.设置导航栏
        setupNavigationBar()

    }
    
    func setupNavigationBar() {
        // 1.设置左侧的Item
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageNamed: "logo",self,action: #selector(leftBarButtonItemClick))

        // 2.设置右侧的Item
        let size = CGSize(width: 40, height: 40)
        let historyItem = UIBarButtonItem(imageNamed: "image_my_history", highlightedImage: "Image_my_history_click", size: size,self,action: #selector(leftBarButtonItemClick))
        let searchItem = UIBarButtonItem(imageNamed: "btn_search", highlightedImage: "btn_search_clicked", size: size,self,action: #selector(leftBarButtonItemClick))
        let qrcodeItem = UIBarButtonItem(imageNamed: "Image_scan", highlightedImage: "Image_scan_click", size: size,self,action: #selector(leftBarButtonItemClick))
        navigationItem.rightBarButtonItems = [historyItem, searchItem, qrcodeItem]
        

    }
}


// MARK:- 点击事件
extension DYHomeViewController {
    @objc func leftBarButtonItemClick() {
        let tabbar = tabBarController
        tabbar?.navigationController?.navigationBar.isHidden = false
        tabbar?.navigationController?.popToRootViewController(animated: true)
    }
}
