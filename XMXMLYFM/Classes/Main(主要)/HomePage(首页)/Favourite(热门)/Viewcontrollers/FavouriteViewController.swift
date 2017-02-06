//
//  FavouriteViewController.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/28.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit

import SwiftyJSON
import HandyJSON

class FavouriteViewController: UIViewController , UITableViewDelegate,UITableViewDataSource
{
    
    var tableView : UITableView = UITableView()
    
    var recommends : Recommends!
    var hotAndGuess : HotAndGuess!
    
    lazy var headerView: RecommendHeaderView = {
        let view = RecommendHeaderView()
        view.frame = CGRect(x:0 ,y:0 ,width:XMScreenWidth, height: 280)
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView = UITableView()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(RecommendCell.self, forCellReuseIdentifier: "RecommendCell")
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.tableView.tableHeaderView = self.headerView
        self.view.addSubview(self.tableView)
        
        self.refreshDataSource()
        
    }
    
    //请求数据
    func refreshDataSource(){
        HomePageApi.requestRecommends { (result, error) in
            //小编推荐
            self.recommends = JSONDeserializer<Recommends>.deserializeFrom(json: JSON(result).description)
            self.headerView.focusImages = self.recommends.focusImages?.list as NSArray?
            self.tableView.reloadSections(NSIndexSet(index: 0) as IndexSet, with: UITableViewRowAnimation.none)
        }
        HomePageApi.requestHotAndGuess { (result, error) in
            self.hotAndGuess = JSONDeserializer<HotAndGuess>.deserializeFrom(json: JSON(result).description)
            self.headerView.discoveryColumns = self.hotAndGuess.discoveryColumns
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLayoutSubviews() {
        self.tableView.frame = CGRect(x:0,y:0,width:XMScreenWidth,height:self.view.height)
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}

extension FavouriteViewController {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if (self.hotAndGuess != nil) {
            return (self.hotAndGuess.hotRecommends?.list?.count)! + 1
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"RecommendCell", for: indexPath) as! RecommendCell
        
        
        if indexPath.section == 0 {
            if (self.recommends != nil) {
                cell.editorRecommendAlbums = self.recommends.editorRecommendAlbums
            }
        }else{
            if self.hotAndGuess != nil {
                cell.hotList = self.hotAndGuess.hotRecommends?.list?[indexPath.section - 1]
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return (XMScreenWidth - 10*4) / CGFloat(3) + 110
    }
}




