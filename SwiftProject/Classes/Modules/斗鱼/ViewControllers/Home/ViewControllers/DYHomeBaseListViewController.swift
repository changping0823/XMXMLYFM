//
//  DYHomeBaseListViewController.swift
//  SwiftProject
//
//  Created by Charles on 2021/5/25.
//

import UIKit

import JXSegmentedView

class DYHomeBaseListViewController: DYBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.randomColor()
    }

}

extension DYHomeBaseListViewController: JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return view
    }
}
