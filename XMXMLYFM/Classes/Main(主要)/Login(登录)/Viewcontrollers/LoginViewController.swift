//
//  LoginViewController.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/30.
//  Copyright © 2016年 任长平. All rights reserved.
//  登录

import UIKit

class LoginViewController: XMBaseViewController {
    var zhanghao : UIButton!
    var kuaijie  : UIButton!
    var lineView : UIView!
    var underLine : UIView!
    var buttons :  [UIButton]!
    
    
    
    let underLineW : CGFloat = XMScreenWidth / 2 - 30 * 2
    
    let leftSpace : CGFloat = 30
    
    var loginButton : UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "登录"
        

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title:"注册",style: UIBarButtonItemStyle.done,target: self,action:#selector(logonClick))
        self.navigationItem.rightBarButtonItem?.tintColor = MAIN_COLOR
        
        self.zhanghao = createButton(tag: 110, title: "账号密码登录")
        self.zhanghao.isSelected = true
        
        self.kuaijie  = createButton(tag: 120, title: "快捷免密登录")
        
        self.buttons.append(self.zhanghao)
        self.buttons.append(self.kuaijie)
        
        
        self.lineView = UIView()
        self.lineView.backgroundColor = RGBA(r: 153, g: 153, b: 153, a: 0.6)
        self.view.addSubview(self.lineView)
        
        
        self.underLine = UIView(frame:CGRect(x:30,y:40,width:underLineW,height:2))
        self.underLine.backgroundColor = MAIN_COLOR
        self.view.addSubview(self.underLine)
        

        
        self.loginButton = UIButton(type:.custom)
        self.loginButton.setTitle("登录", for: .normal)
        self.loginButton.setTitleColor(UIColor.white, for: .normal)
        self.loginButton.setBackgroundImage(UIImage(named:"feedbackAlert_positive_btn"), for: .normal)
        self.view.addSubview(self.loginButton)
        
        
        
        self.makeConstraints()
    }
    
    
    
    
    
    func createButton(tag:Int , title:String) -> UIButton {
        let button = UIButton(type:.custom)
        button.setTitleColor(RGBA(r: 153, g: 153, b: 153, a: 1), for: .normal)
        button.setTitleColor(MAIN_COLOR, for: .selected)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitle(title, for: .normal)
        button.tag = tag
        button.addTarget(self, action: #selector(buttonClick(sender:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button)
        return button
    }
    
    
    func buttonClick(sender:UIButton) {

////        for button in self.buttons {
////            <#code#>
////        }
//        UIView.animate(withDuration: 0.24, animations: {
//            self.underLine.centerX = sender.centerX
//        }, completion: nil)
//
//        
    }
    
    
    
    
    
    func logonClick(){
        self.navigationController?.pushViewController(LogonViewController(), animated: true)
    }
    
    
    
    
    
    
    
    
    func makeConstraints()  {
        self.zhanghao.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview().offset(64)
            make.left.equalToSuperview()
            make.right.equalTo(self.kuaijie.snp.left)
            make.height.equalTo(40)
            make.width.equalTo(self.kuaijie.snp.width)
        }
        
        self.kuaijie.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview().offset(64)
            make.right.equalToSuperview()
            make.left.equalTo(self.zhanghao.snp.right)
            make.height.equalTo(40)
            make.width.equalTo(self.zhanghao.snp.width)
        }
        self.lineView.snp.makeConstraints { (make) -> Void in
            make.left.right.equalToSuperview()
            make.height.equalTo(0.5)
            make.top.equalTo(self.zhanghao.snp.bottom)
        }
        
        self.underLine.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(underLineW)
            make.height.equalTo(2)
            make.centerX.equalTo(self.zhanghao)
            make.bottom.equalTo(self.zhanghao)
        }
        
        self.loginButton.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview().offset(200)
            make.left.equalToSuperview().offset(leftSpace)
            make.right.equalToSuperview().offset(-leftSpace)
            make.height.equalTo(40)
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
