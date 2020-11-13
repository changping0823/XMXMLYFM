//
//  HomeListBaseViewController.swift
//  XMXMLYFM
//
//  Created by Charles on 2020/11/8.
//  Copyright © 2020 任长平. All rights reserved.
//

import UIKit
import JXSegmentedView

class HomeListBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}


extension HomeListBaseViewController: JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return view
    }
}
