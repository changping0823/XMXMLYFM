//
//  HomeViewController.swift
//  SwiftProject
//
//  Created by ren on 2020/11/10.
//

import UIKit
import KakaJSON
import SwiftyJSON
import SnapKit

class HomeViewController: BaseViewController {

    var tableView = UITableView()
    
    lazy var items = [HomeModel]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomeCell.self, forCellReuseIdentifier: "HomeCell")
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        Network.GET(url: "http://m2.qiushibaike.com/article/list/imgrank").success { (response) in
            
            let jsons:[Any] = JSON(response)["items"].arrayObject!
            
            let models = modelArray(from: jsons, HomeModel.self)
            self.items.append(contentsOf: models)

            self.tableView.reloadData()
            
        }.failed { (error) in
            print("--error--> \(error.localizedDescription)")
        }
    }
}



extension HomeViewController: UITableViewDelegate{
    
}


extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HomeCell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeCell
        cell.setModel(model: self.items[indexPath.row])
        cell.delegate = self
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


extension HomeViewController: HomeCellDelegate{
    func zanAction(_ sender: UIButton) {
        print(sender)
    }
}
