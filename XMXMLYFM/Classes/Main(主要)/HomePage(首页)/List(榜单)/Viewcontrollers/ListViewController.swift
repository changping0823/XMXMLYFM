//
//  ListViewController.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/14.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit
import SwiftyJSON
import HandyJSON

class ListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var listArr: Array<RankListModel?> = []
    var focusImages : RankFocusImages!
    
    var tableView :UITableView!
//    var headerView : UIImageView!

    lazy var headerView: ListHeaderView = {
        let view = ListHeaderView()
        view.frame = CGRect(x:0 ,y:0 ,width:XMScreenWidth, height: 180)
        return view
    }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tableView = UITableView(frame:CGRect(x:0,y:0,width:0,height:0), style:UITableView.Style.grouped)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableHeaderView = self.headerView
        self.tableView.register(XMListCell.self, forCellReuseIdentifier: "XMListCell")
        self.view.addSubview(self.tableView)
        
        self.tableView.snp.makeConstraints { (make) -> Void in
            make.edges.equalToSuperview()
        }
        
        
        self.refreshDataSource()
        
    }

    func refreshDataSource() {
        HomePageApi.requestRankingList{ (result,error) in
            
            let array = result?["datas"] as! Array<AnyObject>
            self.listArr = JSONDeserializer<RankListModel>.deserializeModelArrayFrom(json: JSON(array).description)!
            
            self.focusImages = JSONDeserializer<RankFocusImages>.deserializeFrom(dict: result?["focusImages"] as! NSDictionary?)
            self.headerView.listFocusImages = self.focusImages?.list as NSArray?
            self.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ListViewController  {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = ListSectionView(frame:CGRect(x:0 ,y:0 ,width:XMScreenWidth, height: 40))
        let model = self.listArr[section]
        view.titleStr = model?.title
        return view
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.listArr.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let array = self.listArr[section];
        return (array?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"XMListCell", for: indexPath) as! XMListCell
        let programList = self.listArr[indexPath.section]
        cell.programList = programList?.list?[indexPath.row]
        return cell
    }
    
}





