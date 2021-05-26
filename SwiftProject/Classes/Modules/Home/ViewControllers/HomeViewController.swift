//
//  HomeViewController.swift
//  SwiftProject
//
//  Created by ren on 2020/11/10.
//

import UIKit

class HomeViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    let dataArray = ["微博demo","斗鱼demo"]
    
    
    private lazy var tableView: UITableView = {
        let view = UITableView.init(frame: CGRect.zero, style: .plain)
        view.tableFooterView = UIView()
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.tableView)
        self.tableView.frame = self.view.bounds
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "FindCell")
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "FindCell")
        }
        cell?.textLabel?.text = self.dataArray[indexPath.row]
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let title = self.dataArray[indexPath.row]
        if title == "微博demo" {
            self.pushWeiboViewController()
        } else if title == "斗鱼demo" {
            let tabbar = DYTabBarController()
            navigationController?.navigationBar.isHidden = true
            navigationController?.pushViewController(tabbar, animated: true)
        }
        
    }
    
    func pushWeiboViewController(){
        /// 如果有授权信息去 WBTabBarController，否则去 OAuthViewController
        
        if WBUserAccountTool.shareUserAccount.isLogin {
            
            self.navigationController?.pushViewController(WBTabBarController(), animated: true)
            return
        }
        self.navigationController?.pushViewController(OAuthViewController(), animated: true)
    }

}



