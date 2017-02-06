//
//  FindViewController.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/7.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit
import HandyJSON


class FindViewController: XMBaseViewController,UITableViewDelegate,UITableViewDataSource {
    var findModel : FindModel!
    var list : Array <FindList?> = []
    let bgColor : UIColor = RGBA(r: 230, g: 230, b: 230, a: 1)
    
    
    var tableview : UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showBackButton(show: false)
        automaticallyAdjustsScrollViewInsets = true
        self.navigationItem.title = "发现"
        
        
        self.tableview = UITableView()
        self.tableview.delegate = self
        self.tableview.dataSource = self
        self.tableview.tableFooterView = UIView()
        self.tableview.backgroundColor = self.bgColor
        self.tableview.register(FindCell.self, forCellReuseIdentifier: "FindCell")
        self.view.addSubview(self.tableview)
        
        
        self.tableview.snp.makeConstraints { (make) -> Void in
            make.edges.equalToSuperview()
        }
        
        self.refreshDataSource()
        
    }
    
    func refreshDataSource(){
        XMFindApi.requestFind { (result, error) in
            self.findModel = JSONDeserializer<FindModel>.deserializeFrom(dict: result as! NSDictionary?)
            self.list = self.findModel.list!
            self.tableview.reloadData()
        }
    }
}


extension FindViewController{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.list.count
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame:CGRect(x:0,y:0,width:XMScreenWidth,height:10))
        header.backgroundColor = self.bgColor
        return header
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let findList = self.list[section]
        return (findList?.list?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "FindCell", for: indexPath) as! FindCell
        
        let findList  = self.list[indexPath.section]
        cell.findItem = findList?.list?[indexPath.row]
        return cell
    }
    
    
}








