//
//  WBFocusViewController.swift
//  SwiftProject
//
//  Created by Charles on 2021/5/13.
//

import UIKit

class WBFocusViewController: WBBaseListViewController {
    lazy var dataArray: [WBStatus] = [WBStatus]()


    private lazy var tableView : UITableView = {
        let view = UITableView.init(frame: CGRect.zero, style: .plain)
        view.delegate = self
        view.dataSource = self
        return view
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.yellow
        
        self.view.addSubview(self.tableView)
        self.tableView.frame = self.view.bounds
        self.tableView.register(WBStatusCell.self, forCellReuseIdentifier: "WBStatusCell")

        let url = "https://api.weibo.com/2/statuses/home_timeline.json"
        //  准备参数
        let params = [
            "access_token": WBUserAccountTool.shareUserAccount.accessToken!
        ]
        Network.GET(url: url, parameters: params).success { (response) in
            print(response)
            
            guard let dic = response as? [String: AnyObject] else {
                print("字典格式不正确")
                return
            }
            //  字典格式正确
            guard let dicArray = dic["statuses"] as? [[String: AnyObject]] else {
                print("字典格式不正确")
                return
            }
            for value in dicArray {
                
                //  字典转模型
                let status = WBStatus(dic: value)
                
//                //  viewModel
//                let statusViewModel = SUPStatusViewModel(status: status)
//
//                tempArray.append(statusViewModel)
                print(status)
                self.dataArray.append(status)

            }
            
            self.tableView.reloadData()
            
        }.failed { (error) in
            print(error)
        }
    }
    

}


extension WBFocusViewController : UITableViewDelegate {
    
}


extension WBFocusViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WBStatusCell", for: indexPath) as! WBStatusCell
        
        cell.status = self.dataArray[indexPath.row]
        
        return cell
    }
}

