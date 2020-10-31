//
//  XMTabBarController.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/7.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit


// tag的累积值
let kTagPlus: NSInteger = 100

class XMTabBarController: UITabBarController {

    lazy var bgImageView:UIImageView = {
        let imgView = UIImageView()
        imgView.frame = CGRect(x:0,y:XMScreenHeight - (tabBarHeight + safeAreaBottom),width:XMScreenWidth,height:tabBarHeight + safeAreaBottom)
        imgView.image = UIImage(named:"tabbar_bg")
        imgView.isUserInteractionEnabled = true
        return imgView
    }()
    
    lazy var normalImageArray: [UIImage] = {
        var tempArray:[UIImage] = [UIImage]()
        tempArray.append(UIImage(named:"tabbar_icon_homepage_normal")!)
        tempArray.append(UIImage(named:"tabbar_icon_Rss_normal")!)
        tempArray.append(UIImage(named:"tabbar_np_playnon")!)
        tempArray.append(UIImage(named:"tabbar_icon_find_normal")!)
        tempArray.append(UIImage(named:"tabbar_icon_my_normal")!)
        return tempArray
    }()
    lazy var selectImageArray: [UIImage] = {
        var tempArray:[UIImage] = [UIImage]()
        tempArray.append(UIImage(named:"tabbar_icon_homepage_pressed")!)
        tempArray.append(UIImage(named:"tabbar_icon_Rss_pressed")!)
        tempArray.append(UIImage(named:"tabbar_np_playnon")!)
        tempArray.append(UIImage(named:"tabbar_icon_find_pressed")!)
        tempArray.append(UIImage(named:"tabbar_icon_my_pressed")!)
        return tempArray
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createCustomTabBar()
        configSubControllers()
    }
}
// MARK:- 初始化
extension XMTabBarController {
    // MARK: 自定义TabBar
    func createCustomTabBar() {
        // 隐藏原有TabBar
        tabBar.isHidden = true
        // 添加TabBar背景图
        view.addSubview(bgImageView)
        
        let width: CGFloat = XMScreenWidth / 5.0
        
        for index in 0..<5 {
            let btn = UIButton(type: .custom)
            if index == 2 {
                btn.frame = CGRect(x: XMScreenWidth * 0.5 - tabBarHeight * 0.5, y: -10, width: width, height: tabBarHeight + 10)
            } else {
                btn.frame = CGRect(x: width * CGFloat(index), y: 0, width: width, height: tabBarHeight)
            }
            btn.tag = kTagPlus + index
            btn.adjustsImageWhenHighlighted = false
            btn.setImage(normalImageArray[index], for: .normal)
            btn.setImage(selectImageArray[index], for: .selected)
            btn.addTarget(self, action: #selector(tabBarItemSelected(_ :)), for: .touchUpInside)
            
            bgImageView.addSubview(btn)
        }
        
        // 设置中间按钮阴影
        guard let playBtn = bgImageView.viewWithTag(102) else {return}
        let img = UIImageView(image: UIImage(named: "tabbar_np_shadow"))
        let btnW: CGFloat = playBtn.width + 6
        img.frame = CGRect(x: -3, y: -3, width: btnW, height: btnW * 13.0 / 15.0)
        playBtn.addSubview(img)
        
        // 设置默认选中第一个
        tabBarItemSelected(bgImageView.viewWithTag(kTagPlus) as! UIButton)
    }
    
    // MARK: 配置子控制器
    func configSubControllers() {
        tabBar.isHidden = true
        
        var tempArr: [XMBaseNavigationController] = [XMBaseNavigationController]()
        let homepageVC = navigationControllerWith(HomePageViewController())
        tempArr.append(homepageVC)
        let subScribeVc = navigationControllerWith(SubscribeViewController())
        tempArr.append(subScribeVc)
        let playVc = navigationControllerWith(XMPlayViewController())
        tempArr.append(playVc)
        let findVc = navigationControllerWith(FindViewController())
        tempArr.append(findVc)
        let mineVc = navigationControllerWith(MineViewController())
        tempArr.append(mineVc)
        viewControllers = tempArr
        
    }
    func navigationControllerWith(_ vc: UIViewController) -> XMBaseNavigationController {
        let nav = XMBaseNavigationController(rootViewController: vc)
        nav.delegate = self
        return nav
    }
}


extension XMTabBarController:UINavigationControllerDelegate{
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if viewController.hidesBottomBarWhenPushed {
            bgImageView.isHidden = true
        }
    }
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        tabBar.isHidden = true
        if !viewController.hidesBottomBarWhenPushed {
            bgImageView.isHidden = false
        }
    }
}



extension XMTabBarController{
    @objc func tabBarItemSelected(_ btn:UIButton) {
        btn.isSelected = true
        btn.isUserInteractionEnabled = false
        for sbtn in bgImageView.subviews {
            guard let xbtn = sbtn as? UIButton else {
                continue
            }
            if xbtn.tag == btn.tag {
                continue
            }
            xbtn.isSelected = false
            xbtn.isUserInteractionEnabled = true
        }
        let btnTag = btn.tag - kTagPlus         // 当前选中按钮的tag
        if versionTabBarSelectedIndex(btnTag) { // 非播放按钮
            selectedIndex  = btnTag
        } else {                                // 播放按钮
            btn.isSelected = false
            btn.isUserInteractionEnabled = true
        }

    }
    func versionTabBarSelectedIndex(_ index: NSInteger) -> Bool {
        if index == 2 { // 是播放界面
            // TODO: 差播放界面
            let playVc = XMPlayViewController()
            let navi = XMBaseNavigationController(rootViewController: playVc)
            present(navi, animated: true, completion: nil)
            return false
        }
        return true
    }
}



