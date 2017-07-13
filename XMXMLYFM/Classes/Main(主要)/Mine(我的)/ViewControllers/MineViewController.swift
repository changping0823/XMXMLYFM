//
//  MineViewController.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/7.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit

let HeaderHeight : CGFloat = 400 
let bgHeight : CGFloat = 250



class MineViewController: XMBaseViewController,UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate{
    
    var tableView : UITableView!
    var backgroundImageView : UIImageView!
    var shadeView : UIView!
    
    
    lazy var headerView : MineHeaderView = {
        var view = MineHeaderView(frame:CGRect(x:0,y:0,width:XMScreenWidth,height:HeaderHeight-XMNavHeight))
        return view
    }()
    
    var array : Array = [
                          [["title":"已购声音","icon":"me_setting_boughttracks-1"],["title":"我的钱包","icon":"me_setting_account-1"]],
                          [["title":"智能硬件设备","icon":"me_setting_account-1"]],
                          [["title":"更多","icon":"me_setting_more"],["title":"意见反馈","icon":"me_setting_feedback-1"],["title":"设置","icon":"icon_setting_n"]],
                        ]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.showBackButton(show: false)
        //初始化导航条
        self.setNavigationBar()

        
        self.backgroundImageView = UIImageView(frame:CGRect(x:0,y:0,width:XMScreenWidth,height:bgHeight))
        self.backgroundImageView.image = UIImage(named:"my_bg_wdl")
        self.view.addSubview(self.backgroundImageView)
        self.shadeView = UIView(frame:self.view.bounds)
        self.shadeView.backgroundColor = RGBA(r: 205, g: 205, b: 205, a: 0.4)
        self.view.addSubview(self.shadeView)
        
        
        
        self.tableView = UITableView(frame:self.view.bounds,style: UITableViewStyle.plain)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableHeaderView = self.headerView
        self.tableView.tableFooterView = UIView()
        self.tableView.register(MineCell.self, forCellReuseIdentifier: "MineCell")
        self.view.addSubview(self.tableView)
        self.tableView.backgroundColor = UIColor.clear
        
        
        
        self.tableView.snp.makeConstraints { (make) -> Void in
            make.left.top.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-44)
        }

    }
    
    
    func setNavigationBar(){
        
        self.navigationController?.navigationBar.xm_setBackgroundColor(RGBA(r: 104, g: 182, b: 243, a: 0))
        self.navigationController?.navigationBar.showShadow = false
        
        let rightItemImage = itemImage(name: "icon_setting-1")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image:rightItemImage,
                                                                 style: UIBarButtonItemStyle.done,
                                                                 target: self,
                                                                 action:#selector(rightBarButtonItemClick))
    }
    func itemImage(name : String) -> UIImage? {
        var image = UIImage(named:name)
        image = image?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        return image
    }
    
    
    
    func rightBarButtonItemClick() {
        let nav = UINavigationController.init(rootViewController: LoginViewController())
        self.present(nav, animated: true, completion: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}


extension MineViewController{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.array.count
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 10
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView(frame:CGRect(x:0,y:0,width:XMScreenWidth,height:10))
        view.backgroundColor = RGBA(r: 235, g: 235, b: 235, a: 1)
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let arr = self.array[section]
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MineCell", for: indexPath)
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        let dic = self.array[indexPath.section][indexPath.row]
        cell.imageView?.image = UIImage(named:dic["icon"]!)!
        cell.textLabel?.text  = dic["title"]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
        return cell
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsety = scrollView.contentOffset.y
        
        /// 是否显示 shadowImage(分割线)
        self.navigationController?.navigationBar.showShadow = (contentOffsety > bgHeight - XMNavHeight) ? true : false
        
        /// 改变 navigationItem 的图片
        if contentOffsety > bgHeight - XMNavHeight * 2 {
            self.navigationItem.rightBarButtonItem?.image = itemImage(name:"icon_setting_n")
        }else{
            self.navigationItem.rightBarButtonItem?.image = itemImage(name:"icon_setting-1")
        }
        /// 设置navigationBar的背景色和透明度
        let a = (contentOffsety - (bgHeight - XMNavHeight * 2)) / XMNavHeight
        self.navigationController?.navigationBar.xm_setBackgroundColor(RGBA(r: 104, g: 182, b: 243, a:0.4 + a))
        
        /// 改变背景图片的Frame
        if contentOffsety < 0 {
            var rect = self.backgroundImageView.frame
            rect.size.height = bgHeight - contentOffsety
            rect.size.width = XMScreenWidth * (bgHeight-contentOffsety)/bgHeight
            rect.origin.x =  -(rect.size.width - XMScreenWidth)/2
            rect.origin.y = 0
            self.backgroundImageView.frame = rect

        }else{
            var rect = self.backgroundImageView.frame
            rect.size.height = bgHeight
            rect.size.width = XMScreenWidth
            rect.origin.x = 0
            rect.origin.y = -contentOffsety
            self.backgroundImageView.frame = rect
            
        }
        
    }
    
    
    
}
