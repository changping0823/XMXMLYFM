//
//  ClassifyViewController.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/14.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit
import SwiftyJSON
import HandyJSON

class ClassifyViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    var tableView  : UITableView!
    var headerView : UIImageView!
    
    var listArr: Array<CategoriesList?> = []
    
    var categories : Categories!
    
    let number : Int = 6
    
    
 
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.headerView = UIImageView()
        self.headerView.frame = CGRect(x:0,y:0,width:XMScreenWidth,height:200)
        

        self.tableView = UITableView(self.tableView = UITableView(frame:self.view.frame, style:UITableViewStyle.grouped))
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.tableHeaderView = self.headerView
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.tableView.register(ClassifyCell.self, forCellReuseIdentifier: "ClassifyCell")
        self.view.addSubview(self.tableView)
        
        
        self.refreshDataSource()
        
        self.tableView.snp.makeConstraints { (make) -> Void in
            make.edges.equalToSuperview()
        }

    
    }

    //请求数据
    func refreshDataSource(){
        HomePageApi.requestCategories { (result, error) in
            self.categories = JSONDeserializer<Categories>.deserializeFrom(json: JSON(result).description)
            self.listArr = self.categories.list!
            
            let firstItem = self.categories.list?.first
            self.headerView .xm_setImageWithUrl(url: (firstItem?.coverPath)! ,placeholder:"")
            
            self.tableView.reloadData()
        }
    }

}



extension ClassifyViewController {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        let sec = self.listArr.count / 6
        let sub = self.listArr.count % 6
        return sub > 0 ? sec + 1 : sec
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame:CGRect(x:0,y:0,width:XMScreenWidth,height:10))
        view.backgroundColor = RGBA(r: 234, g: 234, b: 234, a: 1)
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sec: NSInteger = self.listArr.count / 6
        if section < sec {
            return 3
        } else {
            return (self.listArr.count % 6) / 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClassifyCell", for: indexPath) as! ClassifyCell
        
        cell.leftModel = self.itemModel(with: indexPath, isLeft: true)
        cell.rightModel = self.itemModel(with: indexPath, isLeft: false)
        
        return cell
    }
    
    
    
    
    
    
    func itemModel(with indexPath: IndexPath, isLeft: Bool) -> CategoriesList? {
        var index = indexPath.section * 6
        index += indexPath.row * 2
        index = isLeft ? index + 1 : index + 2
        if listArr.count <= index {
            return nil
        }
        return listArr[index]
    }
    
    
}











