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
import JXSegmentedView

protocol DLNoNav {
    
}

class HomeViewController: BaseViewController,DLNoNav {

    let segmentedDataSource = JXSegmentedTitleDataSource()
    var tableView = UITableView()
    
    var segmentedView = JXSegmentedView()
    
    lazy var listContainerView:JXSegmentedListContainerView! = {
        return JXSegmentedListContainerView(dataSource: self)
    }()
    
    lazy var items = [HomeModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        
        let titles = ["关注", "推荐"]
        segmentedDataSource.titles = titles;
        segmentedDataSource.titleNormalFont    = UIFont.systemFont(ofSize: 16);
        segmentedDataSource.titleSelectedFont  = UIFont.boldSystemFont(ofSize: 18);
        segmentedDataSource.titleNormalColor   = UIColor.lightGray
        segmentedDataSource.titleSelectedColor = UIColor.black
        segmentedDataSource.itemWidth = 60

        segmentedView.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        segmentedView.delegate = self
        segmentedView.dataSource = segmentedDataSource
        navigationItem.titleView = segmentedView;
        
        segmentedView.listContainer = listContainerView
        view.addSubview(listContainerView)
                
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.register(HomeCell.self, forCellReuseIdentifier: "HomeCell")
//        view.addSubview(tableView)
//
//        tableView.snp.makeConstraints { (make) in
//            make.edges.equalToSuperview()
//        }
//
//        Network.GET(url: "http://m2.qiushibaike.com/article/list/imgrank?page=2").success { (response) in
//
//            let jsons:[Any] = JSON(response)["items"].arrayObject!
//
//            let models = modelArray(from: jsons, HomeModel.self)
//            self.items.append(contentsOf: models)
//
//            self.tableView.reloadData()
//
//        }.failed { (error) in
//            print("--error--> \(error.localizedDescription)")
//        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

//        segmentedView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 50)
        listContainerView.frame = CGRect(x: 0, y: 50, width: view.bounds.size.width, height: view.bounds.size.height - 50)
    }
}



//extension HomeViewController: UITableViewDelegate{
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.navigationController?.pushViewController(HomeDetailViewController(), animated: true)
//    }
//    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//
//    }
//}
//
//
//extension HomeViewController: UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.items.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell: HomeCell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeCell
//        cell.setModel(model: self.items[indexPath.row])
//        cell.delegate = self
//        return cell
//        
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
//}
//
//
//extension HomeViewController: HomeCellDelegate{
//    func zanAction(_ sender: UIButton) {
//        print(sender)
//    }
//}


extension HomeViewController : JXSegmentedViewDelegate{
    
}

extension HomeViewController : JXSegmentedListContainerViewDataSource{
    func numberOfLists(in listContainerView: JXSegmentedListContainerView) -> Int {
        if let titleDataSource = segmentedView.dataSource as? JXSegmentedBaseDataSource {
            return titleDataSource.dataSource.count
        }
        return 0
    }

    func listContainerView(_ listContainerView: JXSegmentedListContainerView, initListAt index: Int) -> JXSegmentedListContainerViewListDelegate {
        if index == 0 {
            return HomeFocusViewController()
        }
        return HomeRecommendViewController()
    }
}

