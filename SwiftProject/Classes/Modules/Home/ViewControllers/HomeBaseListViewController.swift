//
//  HomeBaseListViewController.swift
//  SwiftProject
//
//  Created by Charles on 2021/4/22.
//

import UIKit
import JXSegmentedView

class HomeBaseListViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}


extension HomeBaseListViewController: JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return view
    }
}
