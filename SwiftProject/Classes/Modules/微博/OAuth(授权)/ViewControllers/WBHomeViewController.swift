//
//  WBHomeViewController.swift
//  SwiftProject
//
//  Created by Charles on 2021/5/6.
//

import UIKit

class WBHomeViewController: WBBaseViewController,UITableViewDelegate,UITableViewDataSource {

    private lazy var tableView: UITableView = {
        let view = UITableView.init(frame: CGRect.zero, style: .plain)
        view.tableFooterView = UIView()
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }
    

    //  设置tableView相关操作
    private func setupTableView() {
        self.view.addSubview(self.tableView)
        
        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "WBHomeViewControllerCell")
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "WBHomeViewControllerCell")
        }
        return cell!
    }

}
